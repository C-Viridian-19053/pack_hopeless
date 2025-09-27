Lerp = {}
Lerp.__index = Lerp
Lerp.instances = {}
function Lerp:new(setter_, destroyAfterRun)
    local self = setmetatable({}, Lerp)
    self.start = 0
    self.end_ = 0
    self.elapsed = 0
    self.time = 9999
    self.value = 0 -- used only for variables that need interpolation
    self.setter = setter_ -- used only if setter is set
    self.easing = nil
    self.updateEnabled = false
    self.destroyAfterRun = destroyAfterRun or false
    table.insert(Lerp.instances, self)
    return self
end

function Lerp:destroy()
    for i, v in ipairs(Lerp.instances) do
        if v == self then
            table.remove(Lerp.instances, i)
            break
        end
    end
    self.updateEnabled = false
    self.setter = nil
end

function Lerp:run(start, end_, time, easing)
    self.start = start
    self.end_ = end_
    self.time = time*60
    self.easing = easing
    self.elapsed = 0
    if (self.updateEnabled == false) then self.updateEnabled = true end
    return self
end

-- Various easings for Lerp
Easing = {
    EASE_OUT = function(t) local p = t - 1; return math.pow(p, 3) + 1 end,
    BACK_OUT = function(t) local c1 = 1.70158; local c3 = c1 + 1; return 1 + c3 * (t - 1)^3 + c1 * (t - 1)^2 end,
    BACK_IN = function(t) local s = 1.70158; return t * t * ((s + 1) * t - s) end,
    EASE_IN = function(t) return t * t end,
    LINEAR = function(t) return t end
}

-- Lerp will not work until you call update method of value that must be interpolated
function Lerp:update(mFrameTime)
    if (self.updateEnabled == false or self.elapsed > self.time) then return end
    self.elapsed = self.elapsed + mFrameTime
    local t = math.min(self.elapsed / self.time, 1)
    local easedT = self.easing and self.easing(t) or t
    local newValue = self.start + (self.end_ - self.start) * easedT
    if self.setter ~= nil then self.setter(newValue) else self.value = newValue end
    if self.elapsed >= self.time then 
        if self.destroyAfterRun then
            self:destroy()
        else
            self.updateEnabled = false 
        end
    end
end


function Lerp.updateAll(mFrameTime) for _, instance in pairs(Lerp.instances) do instance:update(mFrameTime) end end