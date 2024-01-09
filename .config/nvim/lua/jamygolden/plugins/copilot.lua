return {
  "github/copilot.vim",
  config = function()
    -- Force enable for work projects if the env var is set
    local workDirectoryPath = os.getenv("WORK_DIRECTORY")
    if workDirectoryPath then
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = os.getenv("WORK_DIRECTORY") .. "/*",
        command = "Copilot enable"
      })
    else
      -- Force disable everywhere
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = os.getenv("WORK_DIRECTORY") .. "/*",
        command = "Copilot enable"
      })
    end
  end
}