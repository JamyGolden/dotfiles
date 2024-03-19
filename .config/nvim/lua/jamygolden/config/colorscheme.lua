local theme_name_path = vim.fn.expand("$XDG_DATA_HOME/tinted-theming/tinty/current_scheme")
local is_set_theme_file_readable = vim.fn.filereadable(theme_name_path) == 1 and true or false

vim.o.termguicolors = true
vim.g.base16colorspace = 256

local function read_file(path)
  local file, err = io.open(path, "r")

  if not file then
    print("Error opening file: " .. err)

    return nil
  end

  local content = file:read("*a")
  file:close()

  return content
end

local function handle_focus_gained()
  local current_theme_name = vim.g.colors_name
  local new_theme_name = read_file(theme_name_path)

  if current_theme_name ~= new_theme_name then
    vim.cmd("colorscheme " .. new_theme_name)
  end
end

if is_set_theme_file_readable then
  vim.o.termguicolors = true
  vim.g.base16colorspace = 256

  handle_focus_gained()

  vim.api.nvim_create_autocmd("FocusGained", {
    callback = handle_focus_gained,
  })
end