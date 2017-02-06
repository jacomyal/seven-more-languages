function end_in_3(num)
  return num % 10 == 3
end

-- =end_in_3(123)
-- =end_in_3(124)
-- =end_in_3(123.2)



function is_prime(num)
  for i = 2, math.sqrt(num) do
    if num % i == 0 then
      return false
    end
  end
  return true
end

-- =is_prime(1)
-- =is_prime(2)
-- =is_prime(9)
-- =is_prime(11)



function first_prime_3(num)
  local found = 0
  local cursor = 0
  while found < num do
    if end_in_3(cursor) and is_prime(cursor) then
      found = found + 1
      print(cursor)
    end
    cursor = cursor + 1
  end
end

-- =first_prime_3(10)



function for_loop(a, b, f)
  local i = a
  while i <= b do
    f(i)
    i = i + 1
  end
end

-- for_loop(1, 5, function(i) print(i) end)



function reduce(max, init, f)
  local acc = init or 0
  for i = 1, max do
    acc = f(acc, i)
  end
  return acc
end

function add(previous, next)
  return previous + next
end

-- =reduce(5, 0, add)



function factorial(n)
  return reduce(n, 1, function(a, b) return a * b end)
end

-- =factorial(5)
