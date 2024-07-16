return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
    config = function()
      local lsp_zero = require("lsp-zero")

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      lsp_zero.format_on_save({
        servers = {
          ["lua_ls"] = { "lua" },
          ["rust-analyzer"] = { "rust" },
          ["biome"] = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
          -- stylelint_lsp auto fixes based on settings
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },

  -- LSP
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp-zero").extend_lspconfig()
      local lspconfig = require("lspconfig")

      lspconfig.kotlin_language_server.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.markdown_oxide.setup({})
      lspconfig.stylelint_lsp.setup({
        filetypes = { "css", "scss" },
        settings = {
          stylelintplus = {
            autoFixOnSave = true,
            autoFixOnFormat = true,
          },
        },
      })
      lspconfig.biome.setup({})
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim", "require", "pcall", "pairs" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            completion = {
              workspaceWord = true,
              callSnippet = "Replace",
            },
            hint = {
              enable = true,
            },
            format = {
              enable = true,
            },
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      { "stevearc/conform.nvim" },
    },
    keys = {
      {
        "<leader>n",
        function()
          vim.diagnostic.goto_next()
        end,
        desc = "Go to next error",
      },
      {
        "<leader>N",
        function()
          vim.diagnostic.goto_prev()
        end,
        desc = "Go to next error",
      },
    },
  },
}
