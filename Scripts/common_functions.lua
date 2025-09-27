-----------------------------------------------------
--//////////////////////INFOS//////////////////////--
-----------------------------------------------------
-- File : commonFunctions
-- Author : eilm
-- Version : 1.3 (04/21/19)
-----------------------------------------------------
-- README :
-- Those were written for pure convenience.
-- Nothing over the top really but for the sake of 
-- actual decent programming and not having to deal 
-- with writing stupidly named hardcoded functions.
-----------------------------------------------------
-- HOW TO USE :
-- Put the following line into your .lua scripts :
-- BEGIN# exec_Script("commonfunctions.lua") #END
-- Without the '_' between "exec" and "Script".
-----------------------------------------------------
--/////////////////////////////////////////////////--
-----------------------------------------------------

-----------------------------------------------------
--//////////////////GETTER+SETTER//////////////////--
-----------------------------------------------------

-----------------------------------------------------

local phase = 0;
local pLock = false;
local rotMode = 0;
local spdAccel = 0;
local _3Dfx = false;

-- getSpeed : return level speed
function getSpeed()
	return l_getSpeedMult()
end

-- getRot : return level rotation
function getRot()
	return l_getRotationSpeed()
end

-- getRotDir : return rotation direction
function getRotDir()
	if getRot() >= 0 then return 1 end
	return (-1)
end

-- getRotAbs : return rotation value
function getRotAbs()
	return getRot() * getRotDir()
end

-- getPulseMin : return level pulse_min
function getPulseMin()
	return l_getPulseMin()
end

-- getPhase : return level's phase
function getPhase()
	return phase
end

-- getPLock : return if patterns should be locked or not
function getPLock()
	return pLock
end

-- getRotM : return level's rotation mode
function getRotM()
	return rotMode
end

-- getRotM : return level's accel mode
function getSpdA()
	return spdAccel
end

-- get3Dfx : return if 3D effect is on/off
function get3Dfx()
	return _3Dfx
end

-- getDM : return level's delay multiplier
function getDM()
	return l_getDelayMult()
end

-- getPI : return level's pulse increment (style)
function getPI()
	return s_getPulseInc()
end

-----------------------------------------------------

-- setSpeed : set "speed" as new level's speed
function setSpeed(speed)
	l_setSpeedMult(speed)
end

-- setRot : set "rot" as new level's rotation
function setRot(rot)
	l_setRotationSpeed(rot)
end

-- setPulseMin : set "low" as new level's pulse_min
function setPulseMin(low)
	l_setPulseMin(low)
end

-- setPhase : set "pn" level's phase
function setPhase(pn)
	phase = pn;
end

-- setWallSkewR: set "wsr" as new level's wall right skew
function setWallSkewR(wsr)
	l_setWallSkewRight(wsr)
end

-- setDM : set "dm" as level's delay multiplier
function setDM(dm)
	l_setDelayMult(dm)
end

-- setPI : set "pi" as level's pulse increment (style)
function setPI(pi)
	s_setPulseInc(pi)
end


-----------------------------------------------------

-- retSpeed : get current level's speed and add "speed" to it
function retSpeed(speed)
	setSpeed(getSpeed() + speed)
end

-- retRot : get current level's rotation and multiply it by "rot"
function retRot(rot)
	setRot(getRot() * rot)
end

-- retPulseMin : get current level's pulse_min and add "low" to it
function retPulseMin(low)
	setPulseMin(getPulseMin() + low)
end

-- retDM : get current level's delay multiplier and add "bdm" to it
function retDM(bdm)
	setDM(getDM() + bdm)
end

-- retPI : get current level's pulse increment (style) and add "bpi" to it
function retPI(bpi)
	setPI(getPI() + bpi)
end

-----------------------------------------------------
--/////////////////////////////////////////////////--
-----------------------------------------------------

-----------------------------------------------------
--////////////////////FUNCTIONS////////////////////--
-----------------------------------------------------

-- reverseRot : reverse rotation with optional "rotPerc" bonus
function reverseRot(rotPerc)
	rotPerc = rotPerc or 1
	retRot(-rotPerc)
end

-- reverseAbsRot : reverse rotation to a set value
function reverseAbsRot(rot)
	rot = rot or 1
	setRot(-getRotDir() * rot)
end

-- randReverseRot : "cR"/"right" chance of reversing rotation with optional "rotPerc" bonus
function randReverseRot(cR, right, rotPerc)
	rotPerc = rotPerc or 1
	a = math.random(1, right)
	if a <= cR then reverseRot(rotPerc) end
end

local oldKey = -1;

-- addPatterns : add specified patterns and move cursor "index"
function addPatterns()
	addPattern(keys[index])
	index = index + 1
end

-- shufflePatterns : shuffle patterns (; "index" oob)
function shufflePatterns()
	if index - 1 == #keys then
		index = 1
		shuffle(keys)
	end
end

-- addPatternsNR : add specified patterns and move cursor "index" (no-repeat)
function addPatternsNR()
	addPattern(keys[index])
	while oldKey == keys[index] do index = index + 1 end
	oldKey = keys[index]
end

--same function + renamed to addPattern to spawnPattern
function spawnPatterns()
	spawnPattern(getKeys[pat_index])
	pat_index = pat_index + 1
end

function shufflePatternSpawns()
	if pat_index - 1 == #getKeys then
		pat_index = 1
		shuffle(getKeys)
	end
end

function spawnPatternsNR()
	spawnPattern(getKeys[pat_index])
	while oldKey == getKeys[pat_index] do pat_index = pat_index + 1 end
	oldKey = getKeys[pat_index]
end
--

-- accelSR : increase speed/rotation with optional "sa" / "ra" bonus
function accelSR(sa, ra)
	sa = sa or 0
	ra = ra or 1
	retSpeed(sa)
	retRot(ra)
end

-- demiseSRP : accelSR with optional modifications to pulse_min
function demiseSRP(sa, ra, pa)
	pa = pa or 0
	accelSR(sa, ra)
	retPulseMin(pa)
end

-- changeSide : switch side 
function changeSide(l, h, p)
	p = p or 0.5
	a = math.random(0, 100) / 100
	if a < p then l_setSides(l)
	else l_setSides(h)
	end
end

-- sout : system out
function sout(msg, t)
	t = t or 60
	e_messageAddImportant(msg, t)
end