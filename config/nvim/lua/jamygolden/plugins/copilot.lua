-- Force enable for work projects if the env var is a substr of cwd
local workDirectoryPath = os.getenv("WORK_DIRECTORY") or ""
local startMatch = string.find(vim.fn.getcwd(), workDirectoryPath)

-- If there are issues, run `:Copilot setup`
return {
  "github/copilot.vim",
  config = function()
    if startMatch then
      vim.cmd("Copilot enable");
    else
      vim.cmd("Copilot disable");
    end
  end
}
