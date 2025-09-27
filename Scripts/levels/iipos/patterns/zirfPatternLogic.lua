u_execScript("common.lua")
u_execScript("commonZirf.lua")

globalTempo = 0
globalSpawnDistanceMult = 1
globalSpawnDistanceAdd = -20
globalCurve = 1

function zirfWait(mWait)
	t_waitS(getSync(globalTempo) * mWait * 1)
end

function zirfThickness(mThickness)
	return (getSync(globalTempo) * mThickness * 3.75 * 80 * l_getSpeedMult()) + 1
end




syncFix = 0

function zirfSyncFixUpdater(beatDuration, beatDelay)
	if l_getLevelTime() > syncFix + beatDuration * getSync(globalTempo) + beatDelay * getSync(globalTempo) then
		t_clear()
		syncFix = syncFix + beatDuration * getSync(globalTempo)
	end
end

function zirfWall(mSide, mThickness)
	t_eval("l_setWallSpawnDistance(100 + 1100 * l_getSpeedMult() * 1.0 * getSync(globalTempo) * globalTimeSignature * globalSpawnDistanceMult + globalSpawnDistanceAdd)")
	w_wall(mSide, mThickness)
end

function zirfWallEx(mSide, mThickness, mExtra)

	for i = 1, mExtra do
		zirfWall(mSide + i, mThickness)
	end
end

function zirfBarrage(mSide, mThickness)
	for i = 1, allSide() - 1 do
		zirfWall(i + mSide, mThickness)
	end
end

function zirfAltBarrage(mSide, mThickness)
	for i = 1, math.ceil(allSide() / 2) do
		zirfWall(i * 2 + mSide, mThickness)
	end
end

function zirfHalf(mSide, mThickness)
	for i = 1, halfSide() do
		zirfWall(i + mSide, mThickness)
	end
end

function zirfMirrorStrip(mSide, mThickness)
	zirfWall(mSide, mThickness)
	zirfWall(mSide + halfSide(), mThickness)
end

function zirfVorta(mSide, mThickness)
	zirfWallEx(mSide, mThickness, math.floor(allSide() / 2) - 1)
	zirfWallEx(mSide + halfSide(), mThickness, math.ceil(allSide() / 2) - 1)
end

function zirfDoubleBarrage(mSide, mThickness)
	for i = 2, allSide() - 2 do
		zirfWall(i + mSide, mThickness)
	end
		zirfWall(mSide, mThickness)
end

function zirfCurveWall(mSide, mThickness, mDir)
	t_eval("l_setWallSpawnDistance(100 + 1100 * l_getSpeedMult() * 1.0 * getSync(globalTempo) * globalTimeSignature * globalSpawnDistanceMult + globalSpawnDistanceAdd)")
	w_wallHModCurveData(0, mSide + halfSide(), mThickness, ( (0.76125 * 2.15 * mDir / getSync(globalTempo)) * 0.5 / 6) * allSide() * globalCurve, 0, -600, 600, false)
end

function zirfCurveWallEx(mSide, mThickness, mDir, mExtra)
	for i = 1, mExtra do
		zirfCurveWall(mSide + i, mThickness, mDir)
	end
end

function zirfCurveWallStop(mSide, mThickness, mDir)
	t_eval("l_setWallSpawnDistance(100 + 1100 * l_getSpeedMult() * 1.0 * getSync(globalTempo) * globalTimeSignature * globalSpawnDistanceMult + globalSpawnDistanceAdd)")
	w_wallHModCurveData(0, mSide + halfSide(), mThickness, mDir * 6, -0.095 * mDir, (mDir - 1) * 30, (mDir + 1) * 30, false)
end

function zirfCurveWallStopEx(mSide, mThickness, mDir, mExtra)
	for i = 1, mExtra do
		zirfCurveWallStop(mSide + i, mThickness, mDir)
	end
end

function zirfWallExmul(mSide, mThickness, mExtra, mExmul)

	for i = 0, mExtra - 1 do
		zirfWall(mSide + i * mExmul, mThickness)
	end
end

