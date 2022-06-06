local cmd = vim.cmd
local fn = vim.fn
local paths = require('jamygolden/utils/paths')
local home_dir = paths.home_dir

local vimrc_background_dir = home_dir .. '/.vimrc_background'
if fn.empty(fn.glob(vimrc_background_dir)) < 1 then
  cmd('let base16colorspace=256')
  cmd('source ' .. home_dir .. '/.vimrc_background')
end
