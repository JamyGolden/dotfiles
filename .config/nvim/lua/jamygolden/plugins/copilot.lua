-- Force enable for work projects if the env var is a substr of cwd
local workDirectoryPath = os.getenv("WORK_DIRECTORY") or ""
local startMatch = string.find(vim.fn.getcwd(), workDirectoryPath)

if startMatch then
  return {
    "github/copilot.vim",
  }
else
  return {}
end
