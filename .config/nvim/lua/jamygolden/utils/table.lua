local function get_length(tbl)
  local getN = 0
  for n in pairs(tbl) do
    getN = getN + 1
  end
  return getN
end

local merge = function(a, b)
  local c = {}

  for k, v in pairs(a) do
    c[k] = v
  end
  for k, v in pairs(b) do
    c[k] = v
  end

  return c
end

local M = {
  get_length = get_length,
  merge = merge,
}

return M
