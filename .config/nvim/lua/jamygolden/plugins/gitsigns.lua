local gitsigns = require('gitsigns')

gitsigns.setup({
  current_line_blame_formatter = '<author>, <abbrev_sha>, <author_time:%Y-%m-%d> - <summary>',
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Telescope has some items bound to the `<leader>g` namespace

    -- Actions
    map({'n', 'v'}, '<leader>gh', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gbl', function() gs.blame_line{full = true} end)
    map('n', '<leader>g/', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>gx', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
