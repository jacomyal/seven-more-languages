function retry(count, body)
  local failed = count
  while failed ~= 0 do
    local generator = coroutine.create(body)
    local succeeded, value = coroutine.resume(generator)

    if not value then
      failed = 0
    else
      failed = failed - 1
    end
  end
end



retry(
  5,
  function()
    if math.random() > 0.2 then
      print('Failed...')
      coroutine.yield('Something bad happened')
    end

    print('Success!')
  end
)
