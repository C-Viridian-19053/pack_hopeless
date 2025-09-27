u_execScript("utils.lua")
u_execScript("common.lua")
u_execScript("commonpatterns.lua")
u_execScript("zimposterspecial.lua")

-- our wall
imposterWallFract = {}
imposterWallFract.__index = imposterWallFract
-- list of all walls
imposterWallFracts = {}

-- functions and walls and patterns and dungeons and dragons and drivers and other shit below
-- constructions: functions used to make patterns
-- imposter walls look like normal walls but can be manipulated

function imposterWallFract:new(handle)
	local obj = {}
	setmetatable(obj, imposterWallFract)
	-- Our handle, our name, our identifier
	obj.cwFract = handle
	-- There are only 2 things certain in life, death and taxes
	obj.dead = false
	return obj
end

red = 255
green = 255
blue = 255
alpha = 255
killitlol = 0

function imposterWallFract:move()
	local range = 2 * math.pi / self.shapeFrac
	
	if killitlol == 1 then self.dead = true end
	
	trueSideFrac = self.sideFrac + math.sin(l_getLevelTime() * self.curveSpeedFrac + self.curveStartFrac + self.curveStartIncFrac) * self.curveFrac
	
	trueDistFrac = self.distanceFrac + math.sin(l_getLevelTime() * self.distanceSpeedCurve + self.distanceStartCurve + self.distanceStartIncCurve) * self.distanceCurve
	
	r1 = trueDistFrac
	r2 = trueDistFrac + self.thicknessFrac
	a1 = (trueSideFrac + 0.5 * self.widthFrac) * range
	a2 = (trueSideFrac - 0.5 * self.widthFrac) * range
	a3 = (trueSideFrac - 0.5 * self.widthThickFrac) * range
	a4 = (trueSideFrac + 0.5 * self.widthThickFrac) * range
	
	cw_setVertexPos(self.cwFract, 0, r1 * math.cos(a1), r1 * math.sin(a1))
	cw_setVertexPos(self.cwFract, 1, r1 * math.cos(a2), r1 * math.sin(a2))
	cw_setVertexPos(self.cwFract, 2, r2 * math.cos(a3), r2 * math.sin(a3))
	cw_setVertexPos(self.cwFract, 3, r2 * math.cos(a4), r2 * math.sin(a4))
	
	
	cw_setVertexColor(self.cwFract, 0, s_getMainColor())
	cw_setVertexColor(self.cwFract, 1, s_getMainColor())
	cw_setVertexColor(self.cwFract, 2, s_getMainColor())
	cw_setVertexColor(self.cwFract, 3, s_getMainColor())
end

function wallArrays()
	ArrayRemove(imposterWallFracts, function(t, i, j)
		local v = t[i]
		if v.dead then
			cw_destroy(v.cwFract)
			return true
		else
			return false
		end
	end);
	
	-- Loop through all imposter walls to handle their movement
	for _, iwfr in ipairs(imposterWallFracts) do
		iwfr:move()
	end
end

-- side is side, distance how far away the wall is, speed how much distance to reduce per frame times mframetime, thickness is thickness, shape is the shape to use for wall vertex calculations, and the last 4 are colors
function wImpWallFrac(mSide, mSidewidth, mSidewidthBase, mSidewidthThickness, mDistance, mDistCurve, mDistStartCurve, mDistStartIncCurve, mDistSpeedCurve, mSpeed, mThickness, mShape, mRed, mGreen, mBlue, mAlpha, mCurve, mCurveStart, mCurveStartInc, mCurveSpeed)
	cwFract = cw_create()
	
	cw_setCollision(cwFract, false)
	
	cw_setVertexColor(cwFract, 0, mRed, mGreen, mBlue, mAlpha)
	cw_setVertexColor(cwFract, 1, mRed, mGreen, mBlue, mAlpha)
	cw_setVertexColor(cwFract, 2, mRed, mGreen, mBlue, mAlpha)
	cw_setVertexColor(cwFract, 3, mRed, mGreen, mBlue, mAlpha)
	
	
	cw_setVertexPos(cwFract, 0, 0, 0)
	cw_setVertexPos(cwFract, 1, 0, 0)
	cw_setVertexPos(cwFract, 2, 0, 0)
	cw_setVertexPos(cwFract, 3, 0, 0)
	
	iwfr = imposterWallFract:new(cwFract)
	-- set up The Shit™
	iwfr.distanceFrac = mDistance
	iwfr.speedFrac = mSpeed
	iwfr.sideFrac = mSide
	iwfr.shapeFrac = mShape
	iwfr.thicknessFrac = mThickness
	iwfr.widthFrac = mSidewidth + mSidewidthBase
	iwfr.widthThickFrac = mSidewidth + mSidewidthThickness
	
	iwfr.curveFrac = mCurve
	iwfr.curveStartFrac = mCurveStart
	iwfr.curveStartIncFrac = mCurveStartInc
	iwfr.curveSpeedFrac = mCurveSpeed
	
	iwfr.distanceCurve = mDistCurve
	iwfr.distanceStartCurve = mDistStartCurve
	iwfr.distanceStartIncCurve = mDistStartIncCurve
	iwfr.distanceSpeedCurve = mDistSpeedCurve
	table.insert(imposterWallFracts, iwfr)
	
	wallArrays()
end