local home_dir = os.getenv("HOME")
local vim_cache_dir = home_dir.."/.cache/nvim"
local backup_dir = vim_cache_dir.."/backup"
local swp_dir = vim_cache_dir.."/swp"
local undo_dir = vim_cache_dir.."/undo"
local nvim_config_dir = home_dir.."/.config/nvim"

local M = {
  backup_dir = backup_dir,
  home_dir = home_dir,
  nvim_config_dir = nvim_config_dir,
  swp_dir = swp_dir,
  undo_dir = undo_dir,
  vim_cache_dir = vim_cache_dir,
}

return M
