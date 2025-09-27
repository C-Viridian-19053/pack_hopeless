-- our wall
impostorWallFract = {}
impostorWallFract.__index = impostorWallFract
-- list of all walls
impostorWallFracts = {}

-- functions and walls and patterns and dungeons and dragons and drivers and other shit below
-- constructions: functions used to make patterns
-- imposter walls look like normal walls but can be manipulated

function impostorWallFract:new(handle)
    local obj = {}
    setmetatable(obj, impostorWallFract)
    -- Our handle, our name, our identifier
    obj.cwFract = handle
    -- There are only 2 things certain in life, death and taxes
    obj.fractDeleted = false
    return obj
end

function impostorWallFract:draw()
    local range = 2 * math.pi / self.shapeFrac

    -- move it move it
    if (self.boolIsAnimatedFrac == 1) then
        self.distanceBeginAnimaFrac = lerp(self.distanceBeginAnimaFrac, self.distanceFrac, 0.05)
    end
    -- time to countdown
    self.timerBeforeDELETEFrac = self.timerBeforeDELETEFrac - (l_getLevelTime() - self.delTimerBeforeDELETEFrac)
    -- babe request times out, time to die
    if self.timerBeforeDELETEFrac <= 0 then self.fractDeleted = true end

    trueSideFrac = self.sideFrac + math.sin(l_getLevelTime() * self.curveSpeedFrac + self.curveStartFrac + self.curveStartIncFrac) * self.curveFrac
    trueDistFrac = self.distanceFrac + math.sin(l_getLevelTime() * self.distanceSpeedCurve + self.distanceStartCurve + self.distanceStartIncCurve) * self.distanceCurve

    r1 = trueDistFrac + self.distanceBeginAnimaFrac
    r2 = trueDistFrac + self.distanceBeginAnimaFrac + self.thicknessFrac
    a1 = (trueSideFrac + 0.5 * self.widthFrac) * range
    a2 = (trueSideFrac - 0.5 * self.widthFrac) * range
    a3 = (trueSideFrac - 0.5 * self.widthThickFrac) * range
    a4 = (trueSideFrac + 0.5 * self.widthThickFrac) * range

    cw_setVertexPos(self.cwFract, 0, r1 * math.cos(a1), r1 * math.sin(a1))
    cw_setVertexPos(self.cwFract, 1, r1 * math.cos(a2), r1 * math.sin(a2))
    cw_setVertexPos(self.cwFract, 2, r2 * math.cos(a3), r2 * math.sin(a3))
    cw_setVertexPos(self.cwFract, 3, r2 * math.cos(a4), r2 * math.sin(a4))

    if self.boolIsMainColor == 1 and self.boolIsColoring == 0 then
        cw_setVertexColor(self.cwFract, 0, s_getMainColor())
        cw_setVertexColor(self.cwFract, 1, s_getMainColor())
        cw_setVertexColor(self.cwFract, 2, s_getMainColor())
        cw_setVertexColor(self.cwFract, 3, s_getMainColor())
    end
end

function cwu_wallFracArrays()
    -- remove dead walls (walls whose request timed out)
    ArrayRemoveIf(impostorWallFracts, function(t, i, j)
        local v = t[i]
        if v.fractDeleted then
            cw_destroy(v.cwFract)
            return true
        else
            return false
        end
    end);

    -- Loop through all imposter walls to handle their movement
    for _, iwfr in ipairs(impostorWallFracts) do
        iwfr:draw()
    end
end

--[[ side is side, side width is how much wall width mult were - 2 type of base & thickness,
     distance how far away the wall is, distance curve how much curve do you have, curve start is curve starting was, curve start increment how many increment affects speed, distance speed curve how fast the curve of distance is,
     distance begin animate how far the wall is - getting into the current distance when you inputted, distance animator bool is bool is this distance animator began,
     speed how much distance to reduce per frame times mframetime, thickness is thickness, shape is the shape to use for wall vertex calculations,
     curve start is curve starting was, curve start increment is curve start increment was,
     main color boolean is a bool about is set to main color,
     coloring is a bool about is coloring or not,
     4 are colors seperated parts,
     and the last timer before remove when fractal is running ]]
function wImpWallFrac(mSide, mSidewidth, mSidewidthBase, mSidewidthThickness,
                      mDistance, mDistCurve, mDistStartCurve, mDistStartIncCurve, mDistSpeedCurve,
                      mDistanceBeginAnima, bIsAnimated,
                      mSpeed, mThickness, mShape,
                      mCurve, mCurveStart, mCurveStartInc, mCurveSpeed,
                      bIsMainColor, mColoring,
                      mRedA, mGreenA, mBlueA, mAlphaA,
                      mRedB, mGreenB, mBlueB, mAlphaB,
                      mRedC, mGreenC, mBlueC, mAlphaC,
                      mRedD, mGreenD, mBlueD, mAlphaD,
                      mTimerBeforeDELETE)

    local cwFract = cw_create();
    cw_setCollision(cwFract, false);

    if mColoring == 0 then
        cw_setVertexColor(cwFract, 0, mRedA, mGreenA, mBlueA, mAlphaA)
        cw_setVertexColor(cwFract, 1, mRedA, mGreenA, mBlueA, mAlphaA)
        cw_setVertexColor(cwFract, 2, mRedA, mGreenA, mBlueA, mAlphaA)
        cw_setVertexColor(cwFract, 3, mRedA, mGreenA, mBlueA, mAlphaA)
    else
        cw_setVertexColor(cwFract, 0, mRedA, mGreenA, mBlueA, mAlphaA)
        cw_setVertexColor(cwFract, 1, mRedB, mGreenB, mBlueB, mAlphaB)
        cw_setVertexColor(cwFract, 2, mRedC, mGreenC, mBlueC, mAlphaC)
        cw_setVertexColor(cwFract, 3, mRedD, mGreenD, mBlueD, mAlphaD)
    end

    cw_setVertexPos(cwFract, 0, 0, 0)
    cw_setVertexPos(cwFract, 1, 0, 0)
    cw_setVertexPos(cwFract, 2, 0, 0)
    cw_setVertexPos(cwFract, 3, 0, 0)

    iwfr = impostorWallFract:new(cwFract)
    -- set up The Shit™
    iwfr.distanceFrac = mDistance
    iwfr.boolIsAnimatedFrac = bIsAnimated or 0
    iwfr.distanceBeginAnimaFrac = mDistanceBeginAnima or 1605
    iwfr.speedFrac = mSpeed
    iwfr.sideFrac = mSide
    iwfr.shapeFrac = mShape
    iwfr.thicknessFrac = mThickness or THICKNESS
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

    iwfr.timerBeforeDELETEFrac = mTimerBeforeDELETE or math.huge
    iwfr.delTimerBeforeDELETEFrac = l_getLevelTime()
    iwfr.boolIsMainColor = bIsMainColor
    iwfr.boolIsColoring = mColoring
    table.insert(impostorWallFracts, iwfr)

    cwu_wallFracArrays()
end

-- evaluated imposter wall (pattern timeline)
function tImpWallFrac(mSide, mSidewidth, mSidewidthBase, mSidewidthThickness,
                      mDistance, mDistCurve, mDistStartCurve, mDistStartIncCurve, mDistSpeedCurve,
                      mDistanceBeginAnima, bIsAnimated,
                      mSpeed, mThickness, mShape,
                      mCurve, mCurveStart, mCurveStartInc, mCurveSpeed,
                      bIsMainColor, mColoring,
                      mRedA, mGreenA, mBlueA, mAlphaA,
                      mRedB, mGreenB, mBlueB, mAlphaB,
                      mRedC, mGreenC, mBlueC, mAlphaC,
                      mRedD, mGreenD, mBlueD, mAlphaD,
                      mTimerBeforeDELETE)
    t_eval([[wImpWallFrac(]] .. mSide .. [[, ]] .. mSidewidth .. [[, ]] .. mSidewidthBase .. [[, ]] .. mSidewidthThickness .. [[, ]] .. mDistance .. [[, ]] .. mDistCurve .. [[, ]] .. mDistStartCurve .. [[, ]] .. mDistStartIncCurve .. [[, ]] .. mDistSpeedCurve .. [[, ]] .. mDistanceBeginAnima .. [[, ]] .. bIsAnimated .. [[, ]] .. mSpeed .. [[, ]] .. mThickness .. [[, ]] .. mShape .. [[, ]] .. mCurve .. [[, ]] .. mCurveStart .. [[, ]] .. mCurveStartInc .. [[, ]] .. mCurveSpeed .. [[, ]] .. bIsMainColor .. [[, ]] .. mColoring .. [[, ]] .. mRedA .. [[, ]] .. mGreenA .. [[, ]] .. mBlueA .. [[, ]] .. mAlphaA .. [[, ]] .. mRedB .. [[, ]] .. mGreenB .. [[, ]] .. mBlueB .. [[, ]] .. mAlphaB .. [[, ]] .. mRedC .. [[, ]] .. mGreenC .. [[, ]] .. mBlueC .. [[, ]] .. mAlphaC .. [[, ]] .. mRedD .. [[, ]] .. mGreenD .. [[, ]] .. mBlueD .. [[, ]] .. mAlphaD ..  [[, ]] .. mTimerBeforeDELETE .. [[)]])
end

-- evaluated imposter wall (event timeline)
function eImpWallFrac(mSide, mSidewidth, mSidewidthBase, mSidewidthThickness,
                      mDistance, mDistCurve, mDistStartCurve, mDistStartIncCurve, mDistSpeedCurve,
                      mDistanceBeginAnima, bIsAnimated,
                      mSpeed, mThickness, mShape,
                      mCurve, mCurveStart, mCurveStartInc, mCurveSpeed,
                      bIsMainColor, mColoring,
                      mRedA, mGreenA, mBlueA, mAlphaA,
                      mRedB, mGreenB, mBlueB, mAlphaB,
                      mRedC, mGreenC, mBlueC, mAlphaC,
                      mRedD, mGreenD, mBlueD, mAlphaD,
                      mTimerBeforeDELETE)
    e_eval([[wImpWallFrac(]] .. mSide .. [[, ]] .. mSidewidth .. [[, ]] .. mSidewidthBase .. [[, ]] .. mSidewidthThickness .. [[, ]] .. mDistance .. [[, ]] .. mDistCurve .. [[, ]] .. mDistStartCurve .. [[, ]] .. mDistStartIncCurve .. [[, ]] .. mDistSpeedCurve .. [[, ]] .. mDistanceBeginAnima .. [[, ]] .. bIsAnimated .. [[, ]] .. mSpeed .. [[, ]] .. mThickness .. [[, ]] .. mShape .. [[, ]] .. mCurve .. [[, ]] .. mCurveStart .. [[, ]] .. mCurveStartInc .. [[, ]] .. mCurveSpeed .. [[, ]] .. bIsMainColor .. [[, ]] .. mColoring .. [[, ]] .. mRedA .. [[, ]] .. mGreenA .. [[, ]] .. mBlueA .. [[, ]] .. mAlphaA .. [[, ]] .. mRedB .. [[, ]] .. mGreenB .. [[, ]] .. mBlueB .. [[, ]] .. mAlphaB .. [[, ]] .. mRedC .. [[, ]] .. mGreenC .. [[, ]] .. mBlueC .. [[, ]] .. mAlphaC .. [[, ]] .. mRedD .. [[, ]] .. mGreenD .. [[, ]] .. mBlueD .. [[, ]] .. mAlphaD ..  [[, ]] .. mTimerBeforeDELETE .. [[)]])
end

function cwu_clearWallFracs()
    cw_clear()
    impostorWallFracts = {}
end