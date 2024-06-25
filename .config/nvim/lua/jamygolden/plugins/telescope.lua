local M = {
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-lua/plenary.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("undo")
    end,
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node_modules/", ".git/", "dist/", "build/", ".yarn" },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
  },
}

local find_git_files = function()
  require("telescope.builtin").git_files({ show_untracked = true })
end

local find_files = function()
  require("telescope.builtin").find_files()
end

local live_grep = function()
  require("telescope.builtin").live_grep()
end

local resume_search = function()
  require("telescope.builtin").resume()
end

local grep_open_file = function()
  require("telescope.builtin").live_grep({ grep_open_files = true })
end

local find_buffers = function()
  require("telescope.builtin").buffers()
end

local help_pages = function()
  require("telescope.builtin").help_tags()
end

local grep_current_buffer = function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end

local search_git_branches = function()
  require("telescope.builtin").git_branches()
end

local search_git_commits = function()
  require("telescope.builtin").git_commits()
end

local search_git_status = function()
  require("telescope.builtin").git_status()
end

local search_undo = function()
  require("telescope").extensions.undo.undo()
end

M.keys = {
  { "<leader>k", find_git_files, desc = "Find Git Files (root dir)" },
  { "<leader>fk", find_files, desc = "Find Files (root dir)" },
  { "<leader>ff", live_grep, desc = "Grep (root dir)" },
  { "<leader>fr", resume_search, desc = "Resume Search" },
  { "<leader>fo", grep_open_file, desc = "Grep Open File" },
  { "<leader>fb", find_buffers, desc = "Find Files in Buffer" },
  { "<leader>fc", search_git_commits, desc = "Find Git Commits" },
  { "<leader>fh", help_pages, desc = "Help Pages" },
  { "<leader>f/", grep_current_buffer, desc = "Buffer" },
  { "<leader>fu", search_undo, desc = "Undo history" },
  { "<leader>u", search_undo, desc = "Undo history" },
  { "<leader>fs", search_git_status, desc = "Git Status" },
}

return M
