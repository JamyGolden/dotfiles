local code_action = function()
  vim.cmd.RustLsp 'codeAction'
end

local hover_info = function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end

local explain_error = function()
  vim.cmd.RustLsp 'explainError'
end

local go_to_parent_module  = function()
  vim.cmd.RustLsp 'parentModule'
end

local render_diagnostics  = function()
  vim.cmd.RustLsp 'renderDiagnostics'
end

local M = {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
}

M.keys = {
  { "<leader>ng", code_action, desc = "Undo history" },
  { "<leader>nk", hover_info, desc = "Undo history" },
  { "<leader>ni", explain_error, desc = "Undo history" },
  { "<leader>n6", go_to_parent_module, desc = "Undo history" },
  { "<leader>nd", render_diagnostics, desc = "Undo history" },
}

return M