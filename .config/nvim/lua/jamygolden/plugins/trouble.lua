return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>xx", function() require("trouble").open() end, desc = "Document Diagnostics (Trouble)" },
    { "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, desc = "Workspace Diagnostics (Trouble)" },
    { "<leader>xd", function() require("trouble").open("document_diagnostics") end, desc = "Document Diagnostics (Trouble)" },
    { "<leader>xl", function() require("trouble").open("loclist") end, desc = "Location List (Trouble)" },
    { "<leader>xq", function() require("trouble").open("quickfix") end, desc = "Quickfix List (Trouble)" },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}