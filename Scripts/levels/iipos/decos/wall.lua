Wall = {}
Wall.__index = Wall
Wall.instances = {}

function Wall:new(collision)
    local collision = collision or "collision"
    local self = setmetatable({}, Wall)
    if collision == "noCollision" then 
        self.id = cw_createNoCollision()
    elseif collision == "collision" then
        self.id = cw_create()
    elseif collision == "deadly" then
        self.id = cw_createDeadly()
    else 
        print(collision.." collision doesn't exist")
    end
    self.distance = 0
    self.side = 0
    self.sides = 0
    self.angle = 0
    self.firstAngle = 0
    self.secondAngle = 0
    self.thickness = 0
    self.vertexColor = {
        {r = 0, g = 0, b = 0, a = 0},
        {r = 0, g = 0, b = 0, a = 0},
        {r = 0, g = 0, b = 0, a = 0},
        {r = 0, g = 0, b = 0, a = 0}
    }
    self.position = {x = 0, y = 0}
    self.scale = {x = 1, y = 1}
    self.skewLeft = 0
    self.skewRight = 0
    self.angleLeft = 0
    self.angleRight = 0
    self.skew = 0
    self.absolutePositionEnabled = false
    self.skewEnabled = true
    table.insert(Wall.instances, self)
    return self
end

function Wall:destroy()
    for i, instance in ipairs(Wall.instances) do
        if instance == self then
            table.remove(Wall.instances, i)
            cw_destroy(self.id)
            break
        end
    end
end

-- Returns coordinates (x, y) adjusted with the level rotation using polar coordinate math.
function getAbsolutePosition(x, y)
    local r, a = (x ^ 2 + y ^ 2) ^ 0.5, math.atan2(y, x)
    a = a + math.rad(l_getRotation() or 0)
    return r * math.cos(a), r * math.sin(a)
end

function Wall:update()
    local x1 = ((self.distance + self.thickness + self.skewLeft) * math.cos(self.firstAngle + self.angleLeft + self.angle)) * self.scale.x + self.position.x 
    local y1 = ((self.distance + self.thickness + self.skewLeft) * math.sin(self.firstAngle + self.angleLeft + self.angle))
    local x2 = ((self.distance + self.thickness + self.skewRight) * math.cos(self.secondAngle + self.angleRight + self.angle)) * self.scale.x + self.position.x
    local y2 = ((self.distance + self.thickness + self.skewRight) * math.sin(self.secondAngle + self.angleRight + self.angle))
    local x3 = (self.distance * math.cos(self.secondAngle + self.angle)) * self.scale.x + self.position.x
    local y3 = (self.distance * math.sin(self.secondAngle + self.angle))
    local x4 = (self.distance * math.cos(self.firstAngle + self.angle)) * self.scale.x + self.position.x
    local y4 = (self.distance * math.sin(self.firstAngle + self.angle))
    if self.skewEnabled == false then
        local skewMult = s_get3dSkew() + 1
        y1 = y1 * skewMult * self.scale.y + self.position.y * skewMult
        y2 = y2 * skewMult * self.scale.y + self.position.y * skewMult
        y3 = y3 * skewMult * self.scale.y + self.position.y * skewMult
        y4 = y4 * skewMult * self.scale.y + self.position.y * skewMult
    else
        y1 = y1 * self.scale.y + self.position.y
        y2 = y2 * self.scale.y + self.position.y
        y3 = y3 * self.scale.y + self.position.y
        y4 = y4 * self.scale.y + self.position.y
    end
    y1 = y1 / (self.skew + 1)
    y2 = y2 / (self.skew + 1)
    y3 = y3 / (self.skew + 1)
    y4 = y4 / (self.skew + 1)
    if self.absolutePositionEnabled == true then
        x1, y1 = getAbsolutePosition(x1, y1)
        x2, y2 = getAbsolutePosition(x2, y2)
        x3, y3 = getAbsolutePosition(x3, y3)
        x4, y4 = getAbsolutePosition(x4, y4)
    end
    cw_setVertexPos(self.id, 0, x1, y1)
    cw_setVertexPos(self.id, 1, x2, y2)
    cw_setVertexPos(self.id, 2, x3, y3)
    cw_setVertexPos(self.id, 3, x4, y4)
    cw_setVertexColor(self.id, 0, self.vertexColor[1].r, self.vertexColor[1].g, self.vertexColor[1].b, self.vertexColor[1].a)
    cw_setVertexColor(self.id, 1, self.vertexColor[2].r, self.vertexColor[2].g, self.vertexColor[2].b, self.vertexColor[2].a)
    cw_setVertexColor(self.id, 2, self.vertexColor[3].r, self.vertexColor[3].g, self.vertexColor[3].b, self.vertexColor[3].a)
    cw_setVertexColor(self.id, 3, self.vertexColor[4].r, self.vertexColor[4].g, self.vertexColor[4].b, self.vertexColor[4].a)
end

function Wall.updateAll()
    for _, wall in pairs(Wall.instances) do
        wall:update()
    end
end

function Wall:updateAngles()
    if self.sides == 0 then return end 
    self.firstAngle = self.side * math.pi / (self.sides / 2) + math.pi / self.sides
    self.secondAngle = self.firstAngle + 0.5 * math.pi / (self.sides / 2) + math.pi / self.sides
end

function Wall:setSide(v) 
    self.side = v
    self:updateAngles()
    self:update()
    return self 
end 

function Wall:setSides(v) 
    self.sides = v
    self:updateAngles()
    self:update() 
    return self 
end 

function Wall:setSkewEnabled(v) self.skewEnabled = v; self:update(); return self end
function Wall:setSkew(v) self.skew = v; self:update(); return self end
function Wall:setThickness(v) self.thickness = v; self:update(); return self end 
function Wall:setDistance(v) self.distance = v; self:update(); return self end 
function Wall:setPosition(v) 
    if type(v) == "table" then
        self.position = {x = v.x or self.position.x, y = v.y or self.position.y}
    else 
        self.position = {x = v, y = v}
    end
    self:update()
    return self 
end 
function Wall:setColor(v) 
    self.vertexColor[1] = {r = v.r or self.vertexColor[1].r, g = v.g or self.vertexColor[1].g, b = v.b or self.vertexColor[1].b, a = v.a or self.vertexColor[1].a}
    self.vertexColor[2] = {r = v.r or self.vertexColor[2].r, g = v.g or self.vertexColor[2].g, b = v.b or self.vertexColor[2].b, a = v.a or self.vertexColor[2].a}
    self.vertexColor[3] = {r = v.r or self.vertexColor[3].r, g = v.g or self.vertexColor[3].g, b = v.b or self.vertexColor[3].b, a = v.a or self.vertexColor[3].a}
    self.vertexColor[4] = {r = v.r or self.vertexColor[4].r, g = v.g or self.vertexColor[4].g, b = v.b or self.vertexColor[4].b, a = v.a or self.vertexColor[4].a}
    self:update()
    return self 
end
function Wall:setVertexColor(i, v) self.vertexColor[i] = {r = v.r or self.vertexColor[i].r, g = v.g or self.vertexColor[i].g, b = v.b or self.vertexColor[i].b, a = v.a or self.vertexColor[i].a}; self:update(); return self end
function Wall:setSkewLeft(v) self.skewLeft = v; self:update(); return self end
function Wall:setSkewRight(v) self.skewRight = v; self:update(); return self end
function Wall:setAngleLeft(v) self.angleLeft = v; self:update(); return self end
function Wall:setAngleRight(v) self.angleRight = v; self:update(); return self end
function Wall:setAngle(v) self.angle = v; self:update(); return self end
function Wall:setScale(v) 
    if type(v) == "table" then
        self.scale = {x = v.x or self.scale.x, y = v.y or self.scale.y}
    else 
        self.scale = {x = v, y = v}
    end
    self:update()
    return self 
end
function Wall:setAbsolutePositionEnabled(v) 
    self.absolutePositionEnabled = not not v
    self:update() 
    return self 
end
function Wall:set(v)
    for k, val in pairs(v) do
        local method = self["set" .. k:sub(1,1):upper() .. k:sub(2)]
        if method ~= nil then method(self, val) else print("method set" .. k:sub(1,1):upper() .. k:sub(2) .. " not found") end
    end
    return self
end