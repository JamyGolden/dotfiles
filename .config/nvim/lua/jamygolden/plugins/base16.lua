local cmd = vim.cmd
local g = vim.g

local base16_project_theme = os.getenv('BASE16_THEME')
if base16_project_theme and g.colors_name ~= 'base16-' .. base16_project_theme then
  cmd('let base16colorspace=256')
  cmd('colorscheme base16-' .. base16_project_theme)
end
