local _private = {}
function strict_read(table, k)
  if _private[k] ~= nil then
    return _private[k]
  else
    error('Invalid key ' .. k)
  end
end

function strict_write(table, k, v)
  if _private[k] ~= nil and v ~= nil then
    error('Duplicate key ' .. k)
  else
    _private[k] = v
  end
end

local mt = {
  __index = strict_read,
  __newindex = strict_write
}



treasure = {}
setmetatable(treasure, mt)

-- treasure.gold = 500
-- print(treasure.gold)

-- print(treasure.silver)
treasure.gold = 1000
treasure.gold = nil
