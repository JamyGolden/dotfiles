return {
  filetypes = { "lua" },
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
  }
}