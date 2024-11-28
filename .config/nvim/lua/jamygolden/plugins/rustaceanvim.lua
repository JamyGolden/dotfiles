local code_action = function()
  vim.cmd.RustLsp("codeAction")
end

local hover_info = function()
  vim.cmd.RustLsp({ "hover", "actions" })
end

local explain_error = function()
  vim.cmd.RustLsp("explainError")
end

local go_to_parent_module = function()
  vim.cmd.RustLsp("parentModule")
end

local render_diagnostics  = function()
  vim.cmd.RustLsp 'renderDiagnostics'
end

local M = {
  "mrcjkb/rustaceanvim",
  version = "^4",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
    }
  end
}

M.keys = {
  { "<leader>ra", code_action, desc = "Code action" },
  { "<leader>rK", hover_info, desc = "Hover information" },
  { "<leader>ri", explain_error, desc = "Explain error" },
  { "<leader>r6", go_to_parent_module, desc = "Go to parent module" },
  { "<leader>rd", render_diagnostics, desc = "Render diagnostic" },
}

return M
