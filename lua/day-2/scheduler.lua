local pending = {}

local function schedule(time, action)
  pending[#pending + 1] = {
    time = time,
    action = action
  }
end

local function wait(seconds)
  coroutine.yield(seconds)
end

local function sort_by_time(arr)
  return table.sort(
    arr,
    function(a, b) return a.time < b.time end
  )
end

local function remove_first(arr)
  local first = arr[1]
  arr[1] = arr[#arr]
  arr[#arr] = nil
  return first
end

local function run()
  while #pending > 0 do
    sort_by_time(pending)
    while os.clock() < pending[1].time do end

    local first = remove_first(pending)
    local _, seconds = coroutine.resume(first.action)

    if seconds then
      later = os.clock() + seconds
      schedule(later, first.action)
    end
  end
end

local scheduler = {
  schedule = schedule,
  run = run,
  wait = wait
}

return scheduler



-- function punch()
--   for i = 1, 5 do
--     print('punch ' .. i)
--     scheduler.wait(1.0)
--   end
-- end

-- function block()
--   for i = 1, 3 do
--     print('block ' .. i)
--     scheduler.wait(2.0)
--   end
-- end

-- scheduler.schedule(0.0, coroutine.create(punch))
-- scheduler.schedule(0.0, coroutine.create(block))
-- scheduler.run()
