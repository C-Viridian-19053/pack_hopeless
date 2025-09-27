impostorWallHoro = {}
impostorWallHoro.__index = impostorWallHoro
impostorWallHoros = {}

function impostorWallHoro:new(handle)
	local obj = {}
	setmetatable(obj, impostorWallHoro)
	obj.cwHoro = handle
	obj.deadHoro = false
	return obj
end

hPi = math.pi / 2

function impostorWallHoro:move(mFrameTime)
	local range = 2 * math.pi / self.shapeHoro
	
	if math.floor(self.thicknessHoro) < 1 then self.deadHoro = true end
	
	if math.floor(self.distanceHoro) < 1 then
		self.thicknessHoro = math.max(self.thicknessHoro - (mFrameTime * self.speedHoro), 0)
	else
		self.distanceHoro = math.max(self.distanceHoro - (mFrameTime * self.speedHoro), 0)
	end
	
	r1 = self.distanceHoro
	r2 = self.distanceHoro + self.thicknessHoro
	rightSide = (self.sideHoro + 0.5) * range
	leftSide = (self.sideHoro - 0.5) * range
	
	a1 = math.sin(closeValue((rightSide * 0.5^1.35 - oPlayer * 0.5^1.35) / (math.abs(rightSide - oPlayer) + 1) ^ 0.54, -hPi, hPi)) * 3.141 + oPlayer
	a2 = math.sin(closeValue((leftSide  * 0.5^1.35 - oPlayer * 0.5^1.35) / (math.abs(leftSide  - oPlayer) + 1) ^ 0.54, -hPi, hPi)) * 3.141 + oPlayer
	
	cw_setVertexPos(self.cwHoro, 0, r1 * math.cos(a1), r1 * math.sin(a1))
	cw_setVertexPos(self.cwHoro, 1, r1 * math.cos(a2), r1 * math.sin(a2))
	cw_setVertexPos(self.cwHoro, 2, r2 * math.cos(a2), r2 * math.sin(a2))
	cw_setVertexPos(self.cwHoro, 3, r2 * math.cos(a1), r2 * math.sin(a1))
	
	cw_setVertexColor4Same(self.cwHoro, s_getPlayerColor())
end

-- side is side, thickness is thickness, and the last distance how far away the wall is
function wImpWallHoro(mSide, mThickness, mDistance)
	local cwHoro = cw_create()
	cw_setVertexPos(cwHoro, 0, 0, 0)
	cw_setVertexPos(cwHoro, 1, 0, 0)
	cw_setVertexPos(cwHoro, 2, 0, 0)
	cw_setVertexPos(cwHoro, 3, 0, 0)
	
	iwh = impostorWallHoro:new(cwHoro)
	-- set up The Shit™
	iwh.distanceHoro = l_getWallSpawnDistance() + mDistance
	iwh.speedHoro = u_getSpeedMultDM() * 5.0
	iwh.sideHoro = mSide
	iwh.shapeHoro = 6
	iwh.thicknessHoro = mThickness
	table.insert(impostorWallHoros, iwh)
end

function wallHoroArrays(mFrameTime)
	ArrayRemoveIf(impostorWallHoros, function(t, i, j)
		local v = t[i]
		if v.deadHoro then cw_destroy(v.cwHoro) return true
		else return false
		end
	end);

	for _, iwh in ipairs(impostorWallHoros) do iwh:move(mFrameTime) end
end

function clearWallHoros()
	cw_clear()
	impostorWallHoros = {}
end