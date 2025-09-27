-- common but for this pack, seperate from everything iv ever done, hopefully to be in polygonal cubics Vol. 2

function allSide() return l_getSides() end
function halfSide() return math.floor(allSide() / 2) end
function thirdsSide() return math.floor(allSide() / 3) end
function fifthsSide() return math.floor(allSide() / 5) end

function quantizeValue(value, mDivision) return math.floor(value * mDivision) / mDivision end
function rand(mMax) return math.random() * mMax end
function rDir() return (math.random(0, 1) - 0.5) * 2 end
function rSide() return math.random(1, allSide()) - 1 end
function getNeg(value) if value >= 0 then return 1 else return -1 end end
function absolVal(value) if value < 0 then return (value * -1) else return (value) end end
function step(value, point) if value > point then return 1 else return 0 end end

function rPi() return math.random() * math.pi end

--although they appear useless, they are mostly used in single use, not long strings of pure m a t h.
-- why? i just like it, not everything has to have a reason
function add(value, amount) return value + amount end 
function sub(value, amount) return value - amount end 
function mul(value, amount) return value * amount end 
function div(value, amount) return value / amount end 

function convValue(value, valueTo, strength, mFrameTime) return value - (0.1 * strength * (value - valueTo)) * mFrameTime end
function closeValue(value, valueMin, valueMax)
	if value < valueMin then
		return valueMin
	elseif value > valueMax then
		return valueMax
	else
		return value
	end
end

function getSync(mTempo) return (mTempo / 60) ^ -1 end

syncedPulseTimer = 0

function setSyncedPulse(mTempo, mDir, mDel)
	if l_getLevelTime() > syncedPulseTimer then
		syncedPulseTimer = syncedPulseTimer + getSync(mTempo)
	end

	if l_getLevelTime() < syncedPulseTimer - getSync(mTempo) + mDel then
		l_setPulseDirection(mDir)
	end
	if l_getLevelTime() > syncedPulseTimer - getSync(mTempo) + mDel then
		l_setPulseDirection(mDir * -1)
	end
end

function pulseActive()
	if l_getLevelTime() > syncedPulseTimer then
		return true
	else
		return false
	end
end

pulseDetectorTimer = 0
pulseIsActive = 0

function pulseDetector(beatDuration)
	if l_getLevelTime() > pulseDetectorTimer then
		pulseDetectorTimer = pulseDetectorTimer + getSync(globalTempo) * beatDuration
		pulseIsActive = 1
	end
end

function pulseDetected()
	if pulseIsActive == 1 then
		pulseIsActive = 0
		return true
	else
		return false
	end
end

levelUpTimer = 0
isLeveled = 0
levelUpTimes = 0
lmultiplierS = 0.9

function levelUp(speedUp, rotUp)
	l_setRotationSpeed(add(l_getRotationSpeed(), rotUp * lmultiplierS * getNeg(l_getRotationSpeed())) * -1)
	l_setSpeedMult(add(l_getSpeedMult(), speedUp))
	lmultiplierS = lmultiplierS * 1.1
    l_setSides(math.random(l_getSidesMin(), l_getSidesMax()))
	a_playSound("levelUp.ogg")
	isLeveled = 1
	levelUpTimes = levelUpTimes + 1
end

function doLevelUps(beatDuration, speedUp, rotUp)
	if l_getLevelTime() > levelUpTimer + getSync(globalTempo) * beatDuration then
		levelUpTimer = levelUpTimer + getSync(globalTempo) * beatDuration
		levelUp(speedUp, rotUp)
	end
end

function hasLeveled()
	if isLeveled == 1 then
		isLeveled = 0
		return true
	else
		return false
	end
end

isDown = false
invinc = 0

function enableSwap(mFrameTime, mMovement, mFocus, mSwap)
	if mSwap == true then
		if isDown == false then
			u_swapPlayer(true)
			if invinc < 0.35 then
				invinc = 1
			end
		end
		
		isDown = true
	else
		isDown = false
	end
	invinc = convValue(invinc, 0, 1, mFrameTime)
	
	if invinc < 0.85 then
		l_setTutorialMode(false)
	else
		l_setTutorialMode(true)
	end
	
end


















