local paths = require 'jamygolden/utils/paths'
local opt = vim.opt
local fn = vim.fn

-----------------------------------------------------------------------
-- Cache dirs
-----------------------------------------------------------------------
local function create_dir(path)
  if not fn.isdirectory(path) then
    print('creating directory: ' .. path)
    os.execute('mkdir -p ' .. path)
    os.execute('chmod 0770 ' .. path)
  end
end

-- Create cache dirs
create_dir(paths.vim_cache_dir)
create_dir(paths.backup_dir)
create_dir(paths.swp_dir)
create_dir(paths.undo_dir)

opt.undodir=paths.undo_dir .. '//' -- Persistent undo
opt.directory=paths.swp_dir .. '//' -- swp file tmp storage
opt.backupdir=paths.backup_dir .. '//' -- backup file tmp storage
