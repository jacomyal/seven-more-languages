local Queue = {}
Queue.__index = Queue

function Queue.new()
  local self = setmetatable({}, Queue)
  self.queue = {}
  return self
end

function Queue.add(self, value)
  self.queue[#self.queue + 1] = value
end

function Queue.remove(self)
  local res = self.queue[1]
  for i = 1, #self.queue do
    self.queue[i] = self.queue[i + 1]
  end
  return res
end



-- local q = Queue.new()
-- q:add(123)
-- q:add(456)
-- q:add(789)
-- print(q:remove())
-- print(q:remove())
