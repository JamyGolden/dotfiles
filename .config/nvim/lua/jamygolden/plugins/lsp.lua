local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.name == "tsserver" or client.name == "lua_ls"  then
    client.server_capabilities.documentFormattingProvider = false
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end

return {
  -----------------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    event = "BufReadPre",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
    },
    keys = {
      {"<leader>n", function() vim.diagnostic.goto_next() end , desc = "Go to next error" },
      {"<leader>N", function() vim.diagnostic.goto_prev() end , desc = "Go to next error" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "kotlin_language_server",
        "rust_analyzer",
        "jsonls",
        "tsserver",
      }

      for _, lsp in pairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          flags = lsp_flags,
          on_attach = on_attach,
        })
      end

      -- lua
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {"vim"},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }

      -- stylelint
      lspconfig.stylelint_lsp.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
        filetypes = { "css" },
        settings = {
          stylelintplus = {
            autoFixOnSave = true,
            autoFixOnFormat = true
          }
        },
      }

      -- eslint
      lspconfig.eslint.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
          on_attach(client, bufnr)
        end,
        flags = lsp_flags,
        settings = {
          filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
          eslint = {
            alwaysShowStatus = true,
            autoFixOnSave = true,
            debug = true,
            format = {
              enable = true,
            },
            packageManager = "yarn",
            run = "onSave",
            trace = {
              server = "verbose",
            },
            validate = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
            },
          }
        }
      }
    end
  },

  -----------------------------------------------------------------------
  -- Completion
  -----------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
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
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets"}
      },
    },
    keys = {
      { "<Tab>", function() require("luasnip").jump(1) end, desc = "Jump ahead (Luasnip)" },
      { "<S-Tab>", function() require("luasnip").jump(-1) end, desc = "Jump backwards (Luasnip)" },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
            { name = "buffer" },
            { name = "path" },
          })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = "buffer" },
          })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
            { name = "cmdline" }
          })
      })
    end
  },
}