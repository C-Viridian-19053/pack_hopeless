u_execScript("common.lua")
u_execScript("commonZirf.lua")
u_execScript("zirfPatternLogic.lua")

side = rSide()
dir = rDir()
rand = 0

-- the filler pattern are randomly selected between patterns that have them, this is to keep the flow of levels going

function filler()
local randomNumber = math.random(1, 3)
	if randomNumber == 1 then
		zirfAltBarrage(rSide(), 40)
	elseif randomNumber == 2 then
		zirfMirrorStrip(rSide(), 40)
	elseif randomNumber == 3 then
		zirfHalf(rSide(), 40)
	end
end

-- patterns with a changable beat duration, these patterns arent exactly of defined length, but they are not random.
function BarrageSpiral(mTimes)

	for i = 1, mTimes do
		zirfBarrage(side, 40)
		side = side + dir
		
		if i < mTimes then
			zirfWait(0.5)
		end
	end

end

function AltBarrageSpiral(mTimes, mBeatDistance)

	for i = 1, mTimes do
		zirfAltBarrage(side + 1, 40)
		side = side + dir
		dir = dir * -1
		
		if i < mTimes then
			zirfWait(mBeatDistance)
		end
	end

end

function MirrorSpiral(mTimes, mWallLength)

	for i = 1, mTimes * 2 - 1 do
		zirfWall(side, zirfThickness(0.25 * mWallLength))
		zirfWall(side + halfSide(), zirfThickness(0.25 * mWallLength))
		side = side + dir
		
		if i < mTimes * 2 - 1 then
			zirfWait(0.25 * mWallLength)
		end
	end

end

function BarrageLeftRights(mTimes, mDistance, mBeatDistance)

	for i = 1, mTimes do
		zirfBarrage(side, 40)
		side = side + dir * mDistance
		dir = dir * -1
		
		if i < mTimes then
			zirfWait(0.5 * mBeatDistance)
		end
	end
end

function VortaSpiral(mTimes, mBeatDistance)

	for i = 1, mTimes do
		zirfVorta(side, 40)
		side = side + dir
		
		if i < mTimes then
			zirfWait(0.5 * mBeatDistance)
		end
	end

end

function DoubleBarrageSpiral(mTimes, mDistance, mBeatDistance)

	for i = 1, mTimes do
		zirfDoubleBarrage(side, 40)
		side = side + dir * mDistance
		
		if i < mTimes then
			zirfWait(0.5 * mBeatDistance)
		end
	end
end

function BarrageInverts(mTimes, mBeatDistance)

	for i = 1, mTimes do
		zirfBarrage(side, 40)
		
		side = side + dir
		dir = dir * -1
		
		if i < mTimes then
			zirfWait(0.5 * mBeatDistance)
		end
	end
end

function DoubleBarrageInverts(mTimes)

	for a = 1, mTimes do
		zirfDoubleBarrage(side, 40)
		
		side = side + dir
		dir = dir * -1
		
		
		if a < mTimes then
			zirfWait(0.5)
		end
	end
end

function HalfSpiral(mTimes, mThickness, mDistance, mWait)

	for i = 1, mTimes do
		zirfHalf(side, mThickness)
		side = side + dir * mDistance
		
		if i < mTimes then
			zirfWait(0.5 * mWait)
		end
	end

end

function WallExSpiral(mTimes, mThickness, mDistance, mBeatDistance, mExtra)

	for i = 1, mTimes do
		zirfWallEx(side, mThickness, mExtra)
		side = side + dir * mDistance
		
		if i < mTimes then
			zirfWait(mBeatDistance)
		end
	end

end


function AltRandom(mTimes, mBeatDistance, mChance)
rand = mChance

	for i = 1, mTimes do
		zirfAltBarrage(side + 1, 40)
		
		if math.random() > rand then
			side = side + dir
			dir = dir * -1
			rand = mChance
		end
		
		rand = rand * 0.5
		
		if i < mTimes then
			zirfWait(mBeatDistance)
		end
	end

end

function DoubleBarrageRandoms(mTimes)
rand = 0.5

	for a = 1, mTimes do
		zirfDoubleBarrage(side, 40)
		
		if math.random() > rand then
			dir = dir * -1
			rand = 0.5
		end
		
		side = side + dir
		rand = rand * 0.5
		
		
		
		if a < mTimes then
			zirfWait(0.5)
		end
	end
end
