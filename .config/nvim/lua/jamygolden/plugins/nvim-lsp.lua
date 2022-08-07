local cmd = vim.cmd
local lspconfig = require('lspconfig')
local keymaps = require 'jamygolden/utils/keymaps'
local nmap = keymaps.nmap

-----------------------------------------------------------------------
-- Setup
-----------------------------------------------------------------------
require('nvim-lsp-installer').setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗'
    }
  }
})

-- Code completion setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- lua
lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- rust
lspconfig.rust_analyzer.setup {}

-- tsserver
lspconfig.tsserver.setup {
  capabilities = capabilities
}

-- stylelint
vim.cmd([[autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync()]])
lspconfig.stylelint_lsp.setup {
  capabilities = capabilities,
  filetypes = { 'css' },
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true
   }
  }
}

-- eslint
cmd([[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]])
lspconfig.eslint.setup {
  capabilities = capabilities,
  settings = {
    filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
    eslint = {
      alwaysShowStatus = true,
      autoFixOnSave = true,
      debug = true,
      format = {
        enable = true,
      },
      packageManager = 'yarn',
      run = 'onSave',
      trace = {
        server = 'verbose',
      },
      validate = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
      },
    }
  }
}

-- json
lspconfig.jsonls.setup {
  capabilities = capabilities,
}

-----------------------------------------------------------------------
-- Keymaps
-----------------------------------------------------------------------
nmap('<Leader>n', ':lua vim.lsp.diagnostic.goto_next()<cr>')
nmap('<Leader>N', ':lua vim.lsp.diagnostic.goto_prev()<cr>')
