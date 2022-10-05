local neotest = require('neotest')
local neotestJest = require('neotest-jest')
local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap

neotest.setup({
  adapters = {
    neotestJest({
      jestCommand = "yarn test:unit --",
      -- jestConfigFile = "custom.jest.config.ts",
      -- env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
  }
})

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap('<Leader>tt', ':lua require("neotest").run.run()<cr>')
