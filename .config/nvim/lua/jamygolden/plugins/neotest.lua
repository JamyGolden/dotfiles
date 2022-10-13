local neotest = require('neotest')
local neotestJest = require('neotest-jest')
local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap

local getPath = function(str,sep)
    sep = sep or '/'
    return str:match("(.*"..sep..")")
end

neotest.setup({
  adapters = {
    neotestJest({
      jestCommand = "yarn test:unit --",
      cwd = function(path)

        return getPath(path)
      end,
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
  },
})

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap('<leader>ti', '<cmd>lua require("neotest").run.run()<cr>')
nmap('<leader>ts', '<cmd>lua require("neotest").run.stop()<cr>')
nmap('<leader>tp', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
