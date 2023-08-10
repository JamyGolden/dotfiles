function log(text)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. "|||" .. text .. "|||" .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-jest',
  },
  keys = {
    { '<leader>tn', function() require('neotest').run.run() end, },
    { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, },
    { '<leader>tr', function() require('neotest').run.run_last() end, },
    { '<leader>tp', function() require('neotest').output_panel.toggle() end, },
    { '<leader>ts', function() require('neotest').summary.toggle() end, },
    { '<leader>to', function() require('neotest').output.open({ enter = true }) end, },
    { '[t', function() require('neotest').jump.prev({ status = 'failed' }) end, },
    { ']t', function() require('neotest').jump.next({ status = 'failed' }) end, },
    { '<leader>ta', function() require('neotest').stop() end, },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "yarn jest ",
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/web/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          cwd = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/travel-app/") then
              return string.match(file, "(.-/[^/]+/)src")
            end

            return vim.fn.getcwd()
          end
        }),
      },
      status = {
        virtual_text = false,
        signs = true,
      },
    })
  end
}