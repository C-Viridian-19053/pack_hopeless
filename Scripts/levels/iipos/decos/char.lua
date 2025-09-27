s = { -- 20 segment display
    {x1=0, y1=0, x2=0.5, y2=0, x3=0.5, y3=0, x4=0, y4=0, type="horizontal"},
    {x1=0.5, y1=0, x2=1, y2=0, x3=1, y3=0, x4=0.5, y4=0, type="horizontal"},
    {x1=0, y1=0, x2=0, y2=0.5, x3=0, y3=0.5, x4=0, y4=0, type="vertical"},
    {x1=0.5, y1=0, x2=0.5, y2=0.5, x3=0.5, y3=0.5, x4=0.5, y4=0, type="vertical"},
    {x1=1, y1=0, x2=1, y2=0.5, x3=1, y3=0.5, x4=1, y4=0, type="vertical"},
    {x1=0, y1=0.5, x2=0.5, y2=0.5, x3=0.5, y3=0.5, x4=0, y4=0.5, type="horizontal"},
    {x1=0.5, y1=0.5, x2=1, y2=0.5, x3=1, y3=0.5, x4=0.5, y4=0.5, type="horizontal"},
    {x1=0, y1=0.5, x2=0, y2=1, x3=0, y3=1, x4=0, y4=0.5, type="vertical"},
    {x1=0.5, y1=0.5, x2=0.5, y2=1, x3=0.5, y3=1, x4=0.5, y4=0.5, type="vertical"},
    {x1=1, y1=0.5, x2=1, y2=1, x3=1, y3=1, x4=1, y4=0.5, type="vertical"},
    {x1=0, y1=1, x2=0.5, y2=1, x3=0.5, y3=1, x4=0, y4=1, type="horizontal"},
    {x1=0.5, y1=1, x2=1, y2=1, x3=1, y3=1, x4=0.5, y4=1, type="horizontal"},

    {x1=0, y1=0, x2=0.5, y2=0.5, x3=0.5, y3=0.5, x4=0, y4=0, type="horizontal"},
    {x1=0.5, y1=0.5, x2=1, y2=0, x3=1, y3=0, x4=0.5, y4=0.5, type="horizontal"},
    {x1=0, y1=1, x2=0.5, y2=0.5, x3=0.5, y3=0.5, x4=0, y4=1, type="horizontal"},
    {x1=0.5, y1=0.5, x2=1, y2=1, x3=1, y3=1, x4=0.5, y4=0.5, type="horizontal"},

    {x1=0, y1=0.5, x2=0.5, y2=0, x3=0.5, y3=0, x4=0, y4=0.5, type="horizontal"},
    {x1=0.5, y1=0, x2=1, y2=0.5, x3=1, y3=0.5, x4=0.5, y4=0, type="horizontal"},
    {x1=0, y1=0.5, x2=0.5, y2=1, x3=0.5, y3=1, x4=0, y4=0.5, type="horizontal"},
    {x1=0.5, y1=1, x2=1, y2=0.5, x3=1, y3=0.5, x4=0.5, y4=1, type="horizontal"}
}
chars = {
    ["a"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8], s[10] },
    ["b"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8], s[10], s[11], s[12] },
    ["c"] = { s[1], s[2], s[3], s[8], s[11], s[12] },
    ["d"] = { s[2], s[4], s[5], s[6], s[8], s[10], s[11], s[12] },
    ["e"] = { s[1], s[2], s[3], s[6], s[7], s[8], s[11], s[12] },
    ["f"] = { s[1], s[2], s[3], s[6], s[7], s[8] },
    ["g"] = { s[1], s[2], s[3], s[7], s[8], s[10], s[11], s[12] },
    ["h"] = { s[3], s[5], s[6], s[7], s[8], s[10] },
    ["i"] = { s[1], s[2], s[4], s[9], s[11], s[12] },
    ["j"] = { s[5], s[10], s[11], s[12] },
    ["k"] = { s[2], s[3], s[4], s[6], s[8], s[9], s[12] },
    ["l"] = { s[3], s[8], s[11], s[12] },
    ["m"] = { s[1], s[2], s[3], s[4], s[5], s[8], s[9], s[10] },
    ["n"] = { s[1], s[2], s[3], s[5], s[8], s[10] },
    ["o"] = { s[1], s[2], s[3], s[5], s[8], s[10], s[11], s[12] },
    ["p"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8] },
    ["q"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[10] },
    ["r"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8], s[16] },
    ["s"] = { s[1], s[2], s[3], s[6], s[7], s[10], s[11], s[12] },
    ["t"] = { s[1], s[2], s[4], s[9] },
    ["u"] = { s[3], s[5], s[8], s[10], s[11], s[12] },
    ["v"] = { s[3], s[5], s[19], s[20] },
    ["w"] = { s[3], s[4], s[5], s[8], s[9], s[10], s[11], s[12] },
    ["x"] = { s[13], s[14], s[15], s[16] },
    ["y"] = { s[3], s[5], s[6], s[7], s[10], s[11], s[12] },
    ["z"] = { s[1], s[2], s[11], s[12], s[14], s[15]},
    ["1"] = { s[1], s[4], s[9], s[11], s[12] },
    ["2"] = { s[1], s[2], s[5], s[6], s[7], s[8], s[11], s[12] },
    ["3"] = { s[1], s[2], s[5], s[6], s[7], s[10], s[11], s[12] },
    ["4"] = { s[3], s[5], s[6], s[7], s[10] },
    ["5"] = { s[1], s[2], s[3], s[6], s[7], s[10], s[11], s[12] },
    ["6"] = { s[1], s[2], s[3], s[6], s[7], s[8], s[10], s[11], s[12] },
    ["7"] = { s[1], s[2], s[5], s[10] },
    ["8"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8], s[10], s[11], s[12] },
    ["9"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[10], s[11], s[12] },
    ["0"] = { s[1], s[2], s[3], s[5], s[8], s[10], s[11], s[12] },
    ["а"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8], s[10] },
    ["б"] = { s[1], s[2], s[3], s[6], s[7], s[8], s[10], s[11], s[12] },
    ["в"] = { s[1], s[3], s[4], s[6], s[7], s[8], s[10], s[11], s[12] },
    ["г"] = { s[1], s[2], s[3], s[8] },
    ["д"] = { s[2], s[4], s[5], s[6], s[7], s[8], s[10] },
    ["е"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8], s[11], s[12] },
    ["ж"] = { s[3], s[4], s[5], s[6], s[7], s[8], s[9], s[10] }, 
    ["з"] = { s[1], s[2], s[5], s[6], s[7], s[10], s[11], s[12] },
    ["и"] = { s[2], s[3], s[4], s[5], s[8], s[9], s[10], s[11] },
    ["й"] = { s[1], s[2], s[7], s[8], s[9], s[10], s[11]},
    ["к"] = { s[2], s[3], s[4], s[6], s[8], s[9], s[12] },
    ["л"] = { s[2], s[4], s[5], s[9], s[10], s[11] },
    ["м"] = { s[1], s[2], s[3], s[4], s[5], s[8], s[9], s[10] },
    ["н"] = { s[3], s[5], s[6], s[7], s[8], s[10] },
    ["о"] = { s[1], s[2], s[3], s[5], s[8], s[10], s[11], s[12] },
    ["п"] = { s[1], s[2], s[3], s[5], s[8], s[10] },
    ["р"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[8] },
    ["с"] = { s[1], s[2], s[3], s[8], s[11], s[12] },
    ["т"] = { s[1], s[2], s[4], s[9] },
    ["у"] = { s[3], s[5], s[6], s[7], s[10], s[11], s[12] },
    ["ф"] = { s[1], s[2], s[3], s[4], s[5], s[6], s[7], s[9], },
    ["х"] = { s[13], s[14], s[15], s[16] },
    ["ц"] = { s[3], s[4], s[6], s[7], s[10] },
    ["ч"] = { s[3], s[5], s[6], s[7], s[10] },
    ["ш"] = { s[3], s[4], s[5], s[8], s[9], s[10], s[11], s[12] },
    ["щ"] = { s[3], s[4], s[5], s[6], s[7], s[10] },
    ["ъ"] = { s[1], s[4], s[7], s[9], s[10], s[12] },
    ["ы"] = { s[3], s[5], s[6], s[8], s[9], s[10], s[11] },
    ["ь"] = { s[3], s[6], s[7], s[8], s[10], s[11], s[12] },
    ["э"] = { s[1], s[2], s[5], s[6], s[7], s[10], s[11], s[12] },
    ["ю"] = { s[2], s[3], s[4], s[5], s[6], s[8], s[9], s[10], s[12] },
    ["я"] = { s[1], s[2], s[3], s[5], s[6], s[7], s[9], s[10], s[11] },
    ["/"] = { s[14], s[15], },
    [":"] = { s[6], s[7], s[11], s[12] },
    ["."] = { s[11] },
    ["_"] = { s[11], s[12] },
    [">"] = { s[18], s[20] },
    ["|"] = { s[4], s[9] },
    ["%"] = { s[2], s[4], s[9], s[11], s[3], s[10]},
    ["*"] = { s[6] }
}

getCharacter = function(char) return chars[char] or {} end

Character = {}
Character.__index = Character
Character.instances = {}

function Character:new(char)
    local self = setmetatable({}, Character)
    local cw = {}
    local segments = getCharacter(char)
    for _, s in ipairs(segments) do 
        local id = cw_createNoCollision()
        cw[#cw + 1] = {
            id = id,
            segments = s,
        }
    end
    self.cw = cw
    self.scale = { x = 1, y = 1 }
    self.color = { r = 0, g = 0, b = 0, a = 255 }
    self.thickness = 1
    self.position = { x = 0, y = 0 }
    self.absolutePositionEnabled = true
    self.angle = 0
    self.skewEnabled = true
    self.skew = 0
    self:update()
    return self
end

function Character:update()
    for _, part in ipairs(self.cw) do
        local id = part.id
        local s = part.segments 
        
        local xOffs = { -self.thickness, -self.thickness, self.thickness,  self.thickness }
        local yOffsV = { -self.thickness, self.thickness, self.thickness, -self.thickness } --3
        local yOffsH = { self.thickness, self.thickness, -self.thickness, -self.thickness }
        local yOffs = (s.type == "vertical") and yOffsV or yOffsH

        for i = 0, 3 do
            local cosA = math.cos(self.angle)
            local sinA = math.sin(self.angle)

            local localX = s["x"..(i+1)] * self.scale.x + xOffs[i+1]
            local localY = s["y"..(i+1)] * self.scale.y + yOffs[i+1] 

            local rotatedX = localX * cosA - localY * sinA
            local rotatedY = localX * sinA + localY * cosA

            local x = rotatedX + self.position.x
            local y
            local skewMult = s_get3dSkew() + 1
            if self.skewEnabled == false then
                y = rotatedY * skewMult + self.position.y * skewMult
            else
                y = rotatedY + self.position.y
            end
            y = y / (self.skew + 1)
            if self.absolutePositionEnabled then
                x, y = getAbsolutePosition(x, y)
            end 
            cw_setVertexPos(id, i, x, y)
        end
        cw_setVertexColor4Same(part.id, self.color.r, self.color.g, self.color.b, self.color.a)
    end
end

function Character:destroy()
    for _, part in pairs(self.cw) do cw_destroy(part.id) end
    for i in pairs(self) do self[i] = nil end
end

function Character:setScale(v) 
    if type(v) == "table" then
        self.scale = { x = v.x or self.scale.x, y = v.y or self.scale.y}
    else
        self.scale = { x = v, y = v}
    end
    self:update()
    return self 
end
function Character:setThickness(v) self.thickness = v; self:update(); return self end
function Character:setPosition(v)
    if type(v) == "table" then
        self.position = { x = v.x or self.position.x, y = v.y or self.position.y }
    else
        self.position = { x = v, y = v}
    end
    self:update()
    return self
end
function Character:setAngle(v) self.angle = v; self:update(); return self end
function Character:setColor(v) self.color = {r = v.r or self.color.r, g = v.g or self.color.g, b = v.b or self.color.b, a = v.a or self.color.a}; self:update(); return self end
function Character:setAbsolutePositionEnabled(v) self.absolutePositionEnabled = v; self:update() return self end
function Character:setSkewEnabled(v) self.skewEnabled = v; self:update(); return self end
function Character:setSkew(v) self.skew = v; self:update(); return self end
function Character:set(v)
    for k, val in pairs(v) do
        local method = self["set" .. k:sub(1,1):upper() .. k:sub(2)]
        if method ~= nil then method(self, val) else print("method set" .. k:sub(1,1):upper() .. k:sub(2) .. " not found") end
    end
    return self
end

function utf8_chars(str)
    local chars = {}
    for uchar in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    return chars
end

String = {}
String.__index = String

function String:new(text)
    local self = setmetatable({}, String)
    self.chars = {}
    self.text = text or ""
    self.direction = "center"
    self.kerning = 0
    self.position = { x = 0, y = 0 }
    self.absolutePositionEnabled = false
    self.charProperties = {}
    self.color = { r = 0, b = 0, g = 0, a = 255 }
    return self
end

function String:calculatePosition(i, c)
    c:setColor(self.color)
    local x
    local charWidth = c.scale.x + self.kerning
    local textWidth = #self.text * charWidth
    if self.direction == "center" then  x = self.position.x - textWidth / 2 + (i - 1) * charWidth
    elseif self.direction == "left" then x = self.position.x + (i - 1) * charWidth
    elseif self.direction == "right" then x = self.position.x - textWidth + (i - 1) * charWidth
    else 
        print(self.direction.." is not a direction.")
        return c
    end
    c:setPosition{x = x, y = self.position.y}
    return c
end

function String:createText()
    for i, char in ipairs(utf8_chars(self.text)) do
        local c = Character:new(char)
        if self.charProperties then c:set(self.charProperties) end
        c = self:calculatePosition(i, c)
        table.insert(self.chars, c)
    end
    return self
end

function String:clearText()
    for _, char in pairs(self.chars) do
        for _, cw in pairs(char.cw) do
            cw_destroy(cw.id)
        end
    end
    self.chars = {}
    return self
end

function String:updateText()
    self:clearText()
    self:createText()
    return self
end

function String:update()
    for i, c in pairs(self.chars) do self:calculatePosition(i, c) end
    return self
end

function String:updateChars() 
    for _, char in pairs(self.chars) do char:update() end
    return self 
end

function String:setCharProperty(key, value)
    if type(self.charProperties) ~= "table" then
        self.charProperties = {}
    end
    if type(self.charProperties[key]) == "table" and type(value) == "table" then
        for k, v in pairs(value) do
            self.charProperties[key][k] = v
        end
    else
        self.charProperties[key] = value
    end
    for _, char in pairs(self.chars) do
        char:set(self.charProperties)
    end
    self:update()
    return self
end

function String:setAngle(v) self.angle = v; self:update(); return self end
function String:setColor(v) self.color = {r = v.r or self.color.r, g = v.g or self.color.g, b = v.b or self.color.b, a = v.a or self.color.a}; self:update(); return self end
function String:setCharProperties(v) self.charProperties = v; self:update(); return self end
function String:setKerning(v) self.kerning = v; self:update(); return self end
function String:setDirection(v) self.direction = v; self:update(); return self end
function String:setText(v) self.text = v; self:updateText(); return self end
function String:setPosition(v) self.position = { x = v.x or self.position.x, y = v.y or self.position.y }; self:update(); return self end
function String:setAbsolutePositionEnabled(v) self.absolutePositionEnabled = v; self:update(); return self end
function String:set(v)
    for k, val in pairs(v) do
        local method = self["set" .. k:sub(1,1):upper() .. k:sub(2)]
        if method ~= nil then method(self, val) else print(tostring(self).."method set" .. k:sub(1,1):upper() .. k:sub(2) .. " not found") end
    end
    self:updateText()
    return self
end