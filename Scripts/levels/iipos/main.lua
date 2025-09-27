-- include useful files
u_execDependencyScript("library_march31osextbase", "march31os_ext_base", "march31onne", "utils.lua")
u_execDependencyScript("library_march31osextbase", "march31os_ext_base", "march31onne", "common.lua")
u_execDependencyScript("library_polywall", "polywall", "syyrion", "master.lua")
u_execDependencyScript("library_slider", "slider", "syyrion", "master.lua")

u_execScript("common_functions.lua")
u_execScript("levels/iipos/utils/timelines.lua")
u_execScript("levels/iipos/utils/dist_common_recr.lua")
u_execScript("levels/iipos/utils/horogon_utils.lua")
u_execScript("levels/iipos/patterns/horogon_pattern_sets.lua")

u_execScript("levels/iipos/decos/zcustomWallFractalRequirements.lua")
u_execScript("levels/iipos/decos/zimpostorspecial.lua")

function zirfWall(mSide, mThickness, mDistance)
	t_eval("l_setWallSpawnDistance(100 + 1100 * u_getSpeedMultDM() * 1.0 * convertBPMtoSeconds(GLOBAL_TEMPO * GLOBAL_TEMPO_DM_STATE) * GLOBAL_TIME_SIGNATURE * GLOBAL_SPAWN_DISTANCE_MULT + GLOBAL_SPAWN_DISTANCE_ADD)")
	t_eval("wImpWallHoro("..(mSide + chunkSide)..", "..mThickness..", "..mDistance..")")
end

local function ib(beat)
	return getBPM(130) * beat
end

level = {
    pulse_bpm = 130 / 4,
    rot = {
		cur = 0,
		dir = 1,
		mult = 1,
	},
}

events = {
	dreaming = {
		space = 0,
		timer = 0,
		max = 40,
		neg = 1,
		tog = false,
		skew = 0,
	},
}

musicOffset = 0 --ib(32) * 6 -- global offset

nPlayer = 0
oPlayer = 0

playerSide = 0

function runCWs(mFrameTime)
	wallHoroArrays(mFrameTime)
	cwu_wallFracArrays()
end

function onInput(mFrameTime, mMovement, mFocus, mSwap)
	nPlayer = u_getPlayerAngle()
	
	if nPlayer < oPlayer - 0.5 or  nPlayer > oPlayer + 0.5 then
		u_setPlayerAngle(oPlayer)
	end
	
	oPlayer = u_getPlayerAngle()

	playerSide = math.floor(oPlayer / math.pi * 3 + 0.5)
end

beatPulse = 0

function onUpdate(mFrameTime)
	cwFrame:step(mFrameTime)
	pdStyle:step()
	if hasLeveled() then
	end

	if pulseActive() then
		s_setBGColorOffset((s_getBGColorOffset() + 1) % 2)
		if getPhase() >= 2 and getPhase() < 666 then
			beatPulse = 40
		end
	end
	
	level.rot.mult = convValue(mFrameTime, level.rot.mult, 1, 0.5)

	beatPulse = convValue(mFrameTime, beatPulse, 0, 2)
	
	l_setBeatPulseMax(convValue(mFrameTime, l_getBeatPulseMax(), beatPulse, 5))
	l_setRotationSpeed(level.rot.cur * level.rot.dir * level.rot.mult)

	--s_set3dSkew(math.sin(l_getLevelTime()) * 0.15 + 0.4)
	setSyncedPulse(
		level.pulse_bpm
	, 1, 0.075)

	zirfSyncFixUpdater(4, 0)
	
	if getPhase() == 0 then
		forceSetPulse((closeValue(l_getLevelTime() - ib(16), 0, ib(16))) / ib(16))
		s_set3dSkew(((closeValue(l_getLevelTime() - ib(16), 0, ib(16))) / ib(16)) * 0.1)
	elseif getPhase() == 1 then
	elseif getPhase() == 2 then
		level.rot.cur = level.rot.cur + 0.0025 * mFrameTime
		level.rot.dir = closeValue(level.rot.dir + 0.1 * mFrameTime, -1, 1)
	elseif getPhase() == 3 or getPhase() == 3.5 then
		events.dreaming.space = events.dreaming.space + mFrameTime*3*events.dreaming.neg
		
		events.dreaming.timer = events.dreaming.timer + mFrameTime
		if events.dreaming.timer > events.dreaming.max then events.dreaming.neg = events.dreaming.neg * -1; events.dreaming.max = math.random(20, 95); events.dreaming.timer = 0 end
		if events.dreaming.space > 150 then events.dreaming.space = 150 elseif events.dreaming.space < -150 then events.dreaming.space = -150 end
		s_set3dSpacing(events.dreaming.space)
		s_set3dPulseMin(0)
		s_set3dPulseMax(2)
		s_set3dPulseSpeed(0.06)
		if getPhase() == 3.5 then
			level.rot.dir = convValue(mFrameTime, level.rot.dir, 0, 0.5)
			events.dreaming.skew = convValue(mFrameTime, events.dreaming.skew, 0, 1)
		else	
			events.dreaming.skew = convValue(mFrameTime, events.dreaming.skew, .45, 1)
		end
		s_set3dSkew(events.dreaming.skew)
	elseif getPhase() == 666 then
		level.rot.cur = convValue(mFrameTime, level.rot.cur, 0, 0.05)
		events.dreaming.skew = convValue(mFrameTime, events.dreaming.skew, 0.1, 1)
		s_set3dSkew(events.dreaming.skew)
	end
end

function beat(beat_type)
	level.rot.mult = beat_type
	if beat_type == 0 then
		u_setFlashColor(0, 0, 0)
	else
		u_setFlashColor(255, 255, 255)
	end
	u_setFlashEffect(128)
end

function onInit()
    l_setSpeedMult(1)
    l_setSpeedInc(0.09)
    l_setSpeedMax(4.6)
    l_setRotationSpeed(0)
    l_setRotationSpeedMax(1.9)
    l_setRotationSpeedInc(0.01)
    l_setDelayMult(1)
    l_setDelayInc(0.0)
    l_setFastSpin(80.0)
    l_setSides(6)
    l_setSidesMin(6)
    l_setSidesMax(6)
    l_setIncEnabled(false) l_setIncTime(math.huge)

    l_setPulseMin(77)
    l_setPulseMax(99)
    l_setPulseSpeed(2)
    l_setPulseSpeedR(0.1)

	l_setRadiusMin(70)
	
	gradientShaderId = shdr_getShaderId("vignette.frag")
	for i = 0, 7 do
		shdr_setActiveFragmentShader(i, gradientShaderId)
	end
	shdr_setUniformFVec2(gradientShaderId, "u_resolution", u_getWidth(), u_getHeight())
	
	shdr_setUniformF(gradientShaderId, "u_scale", 1)
	shdr_setUniformF(gradientShaderId, "u_strength", 1)

	shdr_setUniformF(gradientShaderId, "COL_R", 0)
	shdr_setUniformF(gradientShaderId, "COL_G", 0)
	shdr_setUniformF(gradientShaderId, "COL_B", 0)
	
	l_setDarkenUnevenBackgroundChunk(false)
	s_setMaxSwapTime(math.huge)
	s_setBGColorOffset(0)
	
	GLOBAL_TEMPO = 130 / 2
	GLOBAL_SPAWN_DISTANCE_ADD = -20
	
	pdStyle = PulseDetector:new(closeValue(getBPM(130) * 32 - musicOffset, 0, 999), 0, 130, true, 0, function()
		s_setStyle("iipos_" .. (pdStyle:getLoopAmount() % 2 == 1 and "blue" or "cyan") .. ((getPhase() == 1.5 or getPhase() == 3.5 or getPhase() == 666) and "_dark" or ""))
	end, nil, 0, true, 1)

    cwFrame = TimerRate:new(120, runCWs)
end

function onCursorSwap()
end

function onUnload()
end

function onLoad()
    for _, timing in pairs(timings) do timing() end

	s_setStyle("iipos_intro")
	a_setMusicSeconds("[iipos] nurko - if it isn't you", musicOffset)
	e_messageAdd("\n\n\n\n\n\n\n\nswap is enabled", 2)
	e_messageAdd("\n\n\n\n\n\n\n\nswap is ~not~ enabled", 80)
	HorogonKey()
	
	if musicOffset == 0 then
		p_setSyncedPatternRepairUpdaterTimerOffset(ib(16))
		zirfWait(999)
	end

	if not u_inMenu() then
		wImpGenerateFractalCurve(110, 3, 0.014, 0.18, 6, 120, 8, 0, 0, 255, 255, 255, 55, 1.4, 3, 3, -0.1, 1, math.huge)
		wImpGenerateFractalCurve(110, 3, 0.014, 0.18, 6, 500, 8, 0, 0, 255, 255, 255, 15, 1.4, 3, 3, -0.1, 1, math.huge)
		wImpGenerateFractal(100, 6, 1, 0.05, 1, 70, 10, 0, 0, 255, 255, 255, 255, 1, math.huge)
	end

    local function w(beat)
		e_waitUntilS(closeValue(getBPM(130) * beat - musicOffset, 0, 999, "min"))
	end
    local e = e_eval;
	
	w(32);e([[
	setPhase(1) level.pulse_bpm = 130
    l_setPulseSpeed(2)
    l_setPulseSpeedR(0.6)
	level.rot.cur = 0.025
	]]);
	w(32 * 2);e([[level.rot.dir = -1]]);
	w(32 * 3);e([[
		level.rot.cur = 0.05
		level.rot.dir = 1
		u_setFlashColor(255, 255, 255)
		u_setFlashEffect(255)
	]]);
	w(32 * 3 + 16);e([[level.rot.dir = -1]]);
	w(32 * 3 + 28);e([[
		setPhase(1.5)
		u_setFlashColor(0, 0, 0)
		u_setFlashEffect(255)
		level.pulse_bpm = 130 / 2
		l_setPulseSpeed(2)
		l_setPulseSpeedR(0.25)
	]]);
	w(32 * 4);e([[
		setPhase(1)
		u_setFlashColor(255, 255, 255)
		u_setFlashEffect(255)
		level.rot.dir = 1
		level.rot.cur = 0.01
		level.pulse_bpm = 130 / 2
		l_setPulseSpeed(2)
		l_setPulseSpeedR(0.25)
	]]);
	w(32 * 5);e([[
		level.rot.dir = -1
		level.rot.cur = 0.05
		level.pulse_bpm = 130
		l_setPulseMin(77)
		l_setPulseMax(111)
		l_setPulseSpeed(6)
		l_setPulseSpeedR(1)
	]]);
	w(32 * 5 + 16);e([[
		setPhase(2)
		level.pulse_bpm = 130
		l_setPulseMin(77)
		l_setPulseMax(111)
		l_setPulseSpeed(6)
		l_setPulseSpeedR(1)
	]]);
	w(32 * 5 + 28);e([[
		setPhase(1.5)
		u_setFlashColor(0, 0, 0)
		u_setFlashEffect(255)
		level.rot.cur = 0.05
		level.pulse_bpm = 130 / 2
		l_setPulseMin(77)
		l_setPulseMax(111)
		l_setPulseSpeed(4)
		l_setPulseSpeedR(0.4)
	]]);
	w(32 * 6);e([[
		u_setFlashColor(255, 255, 255)
		u_setFlashEffect(255)
		setPhase(3)
		level.rot.cur = 0.75
		level.pulse_bpm = 130 / 2
		l_setPulseMin(70)
		l_setPulseMax(140)
		l_setPulseSpeed(4)
		l_setPulseSpeedR(0.75)
		setPhase(3);
	]]);
	w(32 * 6 + 6);e([[ setPhase(3.5); u_setFlashColor(0, 0, 0); u_setFlashEffect(255); ]]);
	w(32 * 6 + 8);e([[ setPhase(3); u_setFlashColor(255, 255, 255); u_setFlashEffect(128); level.rot.dir = 1; ]]);
	w(32 * 6 + 18);e([[ setPhase(3.5); u_setFlashColor(0, 0, 0); u_setFlashEffect(255); ]]);
	w(32 * 6 + 20);e([[ setPhase(3); u_setFlashColor(255, 255, 255); u_setFlashEffect(128); level.rot.dir = 1; ]]);
	w(32 * 6 + 22);e([[ setPhase(3.5); u_setFlashColor(0, 0, 0); u_setFlashEffect(255); ]]);
	w(32 * 6 + 24);e([[ setPhase(3); u_setFlashColor(255, 255, 255); u_setFlashEffect(128); level.rot.dir = 1; ]]);
	w(32 * 7);e([[ level.rot.dir = -1; ]]);
	w(32 * 7 + 2);e([[ setPhase(3.5); u_setFlashColor(0, 0, 0); u_setFlashEffect(255); ]]);
	w(32 * 7 + 4);e([[ setPhase(3); u_setFlashColor(255, 255, 255); u_setFlashEffect(128); level.rot.dir = -1; ]]);
	w(32 * 7 + 6);e([[ setPhase(3.5); u_setFlashColor(0, 0, 0); u_setFlashEffect(255); ]]);
	w(32 * 7 + 8);e([[ setPhase(3); u_setFlashColor(255, 255, 255); u_setFlashEffect(128); level.rot.dir = -1; ]]);
	w(32 * 7 + 18);e([[ setPhase(3.5); u_setFlashColor(0, 0, 0); u_setFlashEffect(255); ]]);
	w(32 * 7 + 20);e([[ setPhase(3); u_setFlashColor(255, 255, 255); u_setFlashEffect(128); level.rot.dir = -1; ]]);
	w(32 * 8);e([[
		setPhase(666)
		u_setFlashColor(0, 0, 0)
		u_setFlashEffect(255)
		level.pulse_bpm = 130
		l_setPulseMin(77)
		l_setPulseMin(99)
		l_setPulseSpeed(2)
		l_setPulseSpeedR(0.6)
	]]);
	e_waitUntilS(136) e_kill();
end

function onStep()
chunkSide = playerSide - math.random(30, 34)

	while chunkSide - playerSide < 30 do
		HorogonPatterns(keys[index])
		index = index + 1

		if index - 1 == #keys then
			shuffle(keys)
			index = 1
		end
	end

	zirfWait(12)
end

function onIncrement()
end


