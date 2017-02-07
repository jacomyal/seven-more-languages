function print_table(t)
  for k, v in pairs(t) do
    print(k .. ': ' .. v)
  end
end

-- print_table({ 'foo', 'bar', toto = 'tutu' })



function table_to_string(t)
  local result = {}
  for k, v in pairs(t) do
    result[#result + 1] = k .. ': ' .. v
  end
  return table.concat(result, '\n')
end

-- =table_to_string({ 'foo', 'bar', toto = 'tutu' })



function concatenate(a1, a2)
  local a = {}

  for i = 1, #a1 do
    a[#a + 1] = a1[i]
  end

  for i = 1, #a2 do
    a[#a + 1] = a2[i]
  end

  return a
end

-- print_table(concatenate({ 1, 2, 3 }, { 4, 5, 6 }))



-- local array_mt = { __add = concatenate }
-- local _priv = {}
-- local global_mt = {
--   __newindex = function(t, k, v)
--     setmetatable(v, array_mt)
--     _priv[k] = v
--   end,
--   __index = function(t, k)
--     return _priv[k]
--   end
-- }
-- setmetatable(_G, global_mt)
-- a1 = { 1, 2, 3 }
-- a2 = { 4, 5, 6 }
-- print_table(a1 + a2)
