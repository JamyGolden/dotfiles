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

local contains_key = function(table, element)
  for key, _ in pairs(table) do
    if key == element then
      return true
    end
  end
  return false
end

local contains_value = function(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

local get_keys = function(tbl)
    local keys = {}
    for key, _ in pairs(tbl) do
        table.insert(keys, key)
    end
    return keys
end

local function print_table (t, indent)
    indent = indent or 0
    local indentString = string.rep("  ", indent)

    for key, value in pairs(t) do
        if type(value) == "table" then
            print(indentString .. tostring(key) .. ":")
            print_table(value, indent + 1)
        else
            print(indentString .. tostring(key) .. ": " .. tostring(value))
        end
    end
end

local M = {
  get_length = get_length,
  get_keys = get_keys,
  contains_key = contains_key,
  contains_value = contains_value,
  merge = merge,
  print = print_table,
}

return M