local function get_length(tbl)
  local getN = 0
  for n in pairs(tbl) do
    getN = getN + 1
  end
  return getN
end

local M = {
  get_length = get_length,
}

return M
