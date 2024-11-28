local table_utils = require("jamygolden/utils/table")
local lua_ls_settings = require("jamygolden/plugins/lsp/lua_ls")
local stylelint_lsp_settings = require("jamygolden/plugins/lsp/stylelint_lsp")

local servers = {
  ["eslint"] = {
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },
  -- ["biome"] = {},
  ["jsonls"] = {},
  ["kotlin_language_server"] = {},
  ["lua_ls"] = lua_ls_settings,
  ["markdown_oxide"] = {},
  ["nil_ls"] = {},
  ["stylelint_lsp"] = stylelint_lsp_settings,
  ["ts_ls"] = {},
}

local formatters = {
  -- [Formatter name] = filetype
  ["lua_ls"] = { "lua" },
  ["rust-analyzer"] = { "rust" },
  -- ["biome"] = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
  -- stylelint_lsp auto fixes based on lsp settings
  -- eslint auto fixes based on lsp settings
}

return {
  -----------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "VonHeikemen/lsp-zero.nvim",
    },
    keys = {
      { "<leader>n", function() vim.diagnostic.goto_next() end, desc = "Go to next error" },
      { "<leader>N", function() vim.diagnostic.goto_prev() end, desc = "Go to next error" },
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lsp_zero = require('lsp-zero')
      local lspconfig = require("lspconfig")

      require("lsp-zero").extend_lspconfig()
      require("mason").setup()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      lsp_zero.format_on_save({
        servers = formatters,
      })
      mason_lspconfig.setup {
        ensure_installed = table_utils.get_keys(servers),
      }

      for lsp, settings in pairs(servers) do
        lspconfig[lsp].setup(settings)
      end
    end
  },

  -----------------------------------------------------------------------
  -- Completion
  -----------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load() -- Load default snippets
      require("luasnip.loaders.from_vscode").lazy_load({ -- Load my snippets
        paths = { "./lua/jamygolden/snippets" }
      })
    end
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" }
      },
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
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
          { name = "path" },
        })
      })
    end,
  },
}