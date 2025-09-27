intromut = 1
pulsemut = 1

-- Clones table
function clone(obj)
    if type(obj) ~= 'table' then return obj end
    local copy = {}
    for k, v in pairs(obj) do
        copy[k] = clone(v)
    end
    setmetatable(copy, getmetatable(obj))
    return copy
end

customWall = {
    pulseLine = {},
    fakePlayerArrows = {},
    rotatingCircle = {},
    pulseWalls = {},
    sticks = {},
    particlePtII = {},
}

function getWallSpeed(mFrameTime) return u_getSpeedMultDM() * 5 * mFrameTime end

----------------------------------------------------------
-- PARTICLES PT. I
----------------------------------------------------------

cwParticlesPtI = {}
function cwParticlePtI(side, SIDES, THICKNESS, distance, speed)
    local id = cw_createNoCollision()
    local firstAngle = side * math.pi / (SIDES / 2) + math.pi / SIDES
    local secondAngle = firstAngle + 0.5 * math.pi / (SIDES / 2) + math.pi / SIDES
    local r, g, b, a = s_getMainColor()
    local invR, invG, invB, invA = 255 - r, 255 - g, 255 - b, 255 - a
    
    cw_setVertexPos(id, 0, (distance + THICKNESS) * math.cos(firstAngle), (distance + THICKNESS) * math.sin(firstAngle))
    cw_setVertexPos(id, 1, (distance + THICKNESS) * math.cos(secondAngle), (distance + THICKNESS) * math.sin(secondAngle))
    cw_setVertexPos(id, 2, distance * math.cos(secondAngle), distance * math.sin(secondAngle))
    cw_setVertexPos(id, 3, distance * math.cos(firstAngle), distance * math.sin(firstAngle))
    cw_setVertexColor4Same(id, invR, invG, invB, invA)

    cwParticlesPtI[#cwParticlesPtI + 1] = {
        id = id,
        distance = distance,
        firstAngle = firstAngle,
        secondAngle = secondAngle,
        THICKNESS = THICKNESS,
        speed = speed,
        rotationSpeed = l_getLevelTime() / 1000,
    }
end

function updateParticlesPtI()
    for i = #cwParticlesPtI, 1, -1 do
        if cwParticlesPtI[i].distance < 1000 then
            cwParticlesPtI[i].distance = cwParticlesPtI[i].distance + cwParticlesPtI[i].speed
            cwParticlesPtI[i].firstAngle = cwParticlesPtI[i].firstAngle + cwParticlesPtI[i].rotationSpeed
            cwParticlesPtI[i].secondAngle = cwParticlesPtI[i].secondAngle + cwParticlesPtI[i].rotationSpeed
            cw_setVertexPos(cwParticlesPtI[i].id, 0, (cwParticlesPtI[i].distance + cwParticlesPtI[i].THICKNESS) * math.cos(cwParticlesPtI[i].firstAngle), (cwParticlesPtI[i].distance + cwParticlesPtI[i].THICKNESS) * math.sin(cwParticlesPtI[i].firstAngle))
            cw_setVertexPos(cwParticlesPtI[i].id, 1, (cwParticlesPtI[i].distance + cwParticlesPtI[i].THICKNESS) * math.cos(cwParticlesPtI[i].secondAngle), (cwParticlesPtI[i].distance + cwParticlesPtI[i].THICKNESS) * math.sin(cwParticlesPtI[i].secondAngle))
            cw_setVertexPos(cwParticlesPtI[i].id, 2, cwParticlesPtI[i].distance * math.cos(cwParticlesPtI[i].secondAngle), cwParticlesPtI[i].distance * math.sin(cwParticlesPtI[i].secondAngle))
            cw_setVertexPos(cwParticlesPtI[i].id, 3, cwParticlesPtI[i].distance * math.cos(cwParticlesPtI[i].firstAngle), cwParticlesPtI[i].distance * math.sin(cwParticlesPtI[i].firstAngle))
            local r, g, b, a = s_getMainColor()
            cw_setVertexColor4Same(cwParticlesPtI[i].id, r, g, b, 128)
        else
            cw_destroy(cwParticlesPtI[i].id)
            table.remove(cwParticlesPtI, i)
        end
    end
end

----------------------------------------------------------
-- PARTICLES PT. II
----------------------------------------------------------

-- Creates one particle
function particlePtII(size, xOffset, yOffset)
    local sides = l_getSides()
    local angle = math.atan2(yOffset, xOffset)
    local cw = {
        id = cw_createNoCollision(),
        size = size,
        THICKNESS = THICKNESS,
        xOffset = xOffset or 0, 
        yOffset = yOffset or 0,
        shrinkSpeed = math.random(985, 1016) / 1000,
    }
    table.insert(customWall.particlePtII, cw)
end

function updateParticlesPtII(mFrameTime)
    function setPosition(cw)
        cw_setVertexPos(cw.id, 0, cw.size + cw.xOffset, cw.size + cw.yOffset)
        cw_setVertexPos(cw.id, 1, cw.size + cw.xOffset, cw.yOffset)
        cw_setVertexPos(cw.id, 2, cw.xOffset, cw.yOffset)
        cw_setVertexPos(cw.id, 3, cw.xOffset, cw.size + cw.yOffset)
        cw_setVertexColor4Same(cw.id, s_getMainColor())
    end
    for i = #customWall.particlePtII, 1, -1 do 
        local cw = customWall.particlePtII[i]
        cw.size = cw.size * 0.99
        cw.xOffset = cw.xOffset * cw.shrinkSpeed
        cw.yOffset = cw.yOffset * cw.shrinkSpeed
        setPosition(cw)
        if cw.size < 0.001 then 
            cw_destroy(cw.id)
            table.remove(customWall.particlePtII, i)
        end
    end
end

function createParticlesPtII(amount, size) for i = 1, amount do particlePtII(size, math.random(-800, 800), math.random(-800, 800)) end end

----------------------------------------------------------
-- STICKS /-\_
----------------------------------------------------------

function linerWall(sides, changeDir)
    local sides = sides or 100
    if changeDir == nil then changeDir = false end
    local cw = {
        changeDir = changeDir,
        id = cw_createNoCollision(),
        distance = changeDir and 700 or -50,
        firstAngle = math.random(1, sides) * math.pi / (sides / 2) + math.pi / sides,
        secondAngle = nil,
        THICKNESS = math.random(20, 110),
        speedMult = math.random(50, 150) / 50,
    }
    cw.secondAngle = cw.firstAngle + 0.5 * math.pi / (sides / 2) + math.pi / sides
    table.insert(customWall.sticks, cw)
end

function updateLinerWall(mFrameTime)
    local function setPosition(cw)
        cw_setVertexPos(cw.id, 0, getAbsolutePosition((cw.distance + cw.THICKNESS) * math.cos(cw.firstAngle), (cw.distance + cw.THICKNESS) * math.sin(cw.firstAngle)))
        cw_setVertexPos(cw.id, 1, getAbsolutePosition((cw.distance + cw.THICKNESS) * math.cos(cw.secondAngle), (cw.distance + cw.THICKNESS) * math.sin(cw.secondAngle)))
        cw_setVertexPos(cw.id, 2, getAbsolutePosition(cw.distance * math.cos(cw.secondAngle), cw.distance * math.sin(cw.secondAngle)))
        cw_setVertexPos(cw.id, 3, getAbsolutePosition(cw.distance * math.cos(cw.firstAngle), cw.distance * math.sin(cw.firstAngle)))
        cw_setVertexColor4Same(cw.id, s_getMainColor())
    end
    for i = #customWall.sticks, 1, -1 do 
        local cw = customWall.sticks[i]
        if cw.changeDir == false then cw.distance = cw.distance + getWallSpeed(mFrameTime) * cw.speedMult
        else cw.distance = cw.distance - getWallSpeed(mFrameTime) * cw.speedMult * 2
        end
        setPosition(cw)
        if (cw.distance > 2200 and cw.changeDir == false) or (cw.distance < 0 and cw.changeDir == true) then 
            cw_destroy(cw.id)
            table.remove(customWall.sticks, i)
        end
    end
end

function createLinerWalls(amount, sides, changeDir) for i = 1, amount do linerWall(sides, changeDir) end end


------------------------------------------
-- PULSE WALL
------------------------------------------

function pulseWall(side, THICKNESS, speedMult, distance, xOffset, yOffset)
    local sides = l_getSides()
    local cw = {
        id = cw_createNoCollision(),
        distance = distance or 0,
        firstAngle = side * math.pi / (sides / 2) + math.pi / sides,
        secondAngle = nil,
        THICKNESS = THICKNESS,
        xOffset = xOffset or 0, 
        yOffset = yOffset or 0,
        speedMult = speedMult or 1,
    }
    cw.secondAngle = cw.firstAngle + 0.5 * math.pi / (sides / 2) + math.pi / sides
    table.insert(customWall.pulseWalls, cw)
end

function updatePulseWalls(mFrameTime)
    function setPosition(cw)
        cw_setVertexPos(cw.id, 0, (cw.distance + cw.THICKNESS) * math.cos(cw.firstAngle) + cw.xOffset, (cw.distance + cw.THICKNESS) * math.sin(cw.firstAngle) + cw.yOffset)
        cw_setVertexPos(cw.id, 1, (cw.distance + cw.THICKNESS) * math.cos(cw.secondAngle) + cw.xOffset, (cw.distance + cw.THICKNESS) * math.sin(cw.secondAngle) + cw.yOffset)
        cw_setVertexPos(cw.id, 2, cw.distance * math.cos(cw.secondAngle) + cw.xOffset, cw.distance * math.sin(cw.secondAngle) + cw.yOffset)
        cw_setVertexPos(cw.id, 3, cw.distance * math.cos(cw.firstAngle) + cw.xOffset, cw.distance * math.sin(cw.firstAngle) + cw.yOffset)
        cw_setVertexColor4Same(cw.id, s_getMainColor())
    end
    for i = #customWall.pulseWalls, 1, -1 do 
        local cw = customWall.pulseWalls[i]
        cw.distance = cw.distance + getWallSpeed(mFrameTime) * cw.speedMult
        setPosition(cw)
        if cw.distance > l_getWallSpawnDistance() * 2.5 then 
            cw_destroy(cw.id)
            table.remove(customWall.pulseWalls, i)
        end
    end
end

function createPulseWalls(THICKNESS, speedMult, distance, xOffset, yOffset) for i = 1, l_getSides() do pulseWall(i, THICKNESS, speedMult, distance, xOffset, yOffset) end end


--------------------------------------------
-- PULSING LINE WALL
--------------------------------------------

pulsingLineWallProp = {
    width = 10,
    minHeight = 100,
    maxHeight = 400,
    margin = 2,
}

function pulsingLineWalls(amount, y, x, minHeight, maxHeight, width)
    local halfSpace = (amount * ((width or pulsingLineWallProp.width) + pulsingLineWallProp.margin)) / 2
    for i = 1, amount do pulsingLineWall(-halfSpace + (i * ((width or pulsingLineWallProp.width) + pulsingLineWallProp.margin)) + (x or 0), y, minHeight, maxHeight, width) end
end

function pulsingLineWall(x, y, minHeight, maxHeight, width)
    if not minHeight or not maxHeight then
        minHeight = pulsingLineWallProp.minHeight
        maxHeight = pulsingLineWallProp.maxHeight
    end
    local cw = {
        id = cw_createNoCollision(),
        time = math.pi / 2 * 0.9,
        height = math.random(minHeight, maxHeight),
        width = width or pulsingLineWallProp.width,
        x = x, y = y,
    }
    table.insert(customWall.pulseLine, cw)
end

function updatePulseLineWall(mFrameTime)
    for i = #customWall.pulseLine, 1, -1 do
        local cw = customWall.pulseLine[i]
        cw.time = cw.time + mFrameTime / 10
        cw_setVertexPos(cw.id, 0, getAbsolutePosition(cw.x, cw.y * (s_get3dSkew() + 1) + -cw.height * math.sin(cw.time)))
        cw_setVertexPos(cw.id, 1, getAbsolutePosition(cw.x + cw.width, cw.y * (s_get3dSkew() + 1) + -cw.height * math.sin(cw.time)))
        cw_setVertexPos(cw.id, 2, getAbsolutePosition(cw.x + cw.width, cw.y * (s_get3dSkew() + 1) + cw.height * math.sin(cw.time)))
        cw_setVertexPos(cw.id, 3, getAbsolutePosition(cw.x, cw.y * (s_get3dSkew() + 1) + cw.height * math.sin(cw.time)))
        cw_setVertexColor4Same(cw.id, s_getMainColor())
        if cw.time > math.pi then
            cw_destroy(cw.id)
            table.remove(customWall.pulseLine, i)
        end
    end
end

function fakePlayerArrow(distanceFromCenter, angleOffset, timeIncMult, distance, width, height)
    local cw = {
        id = cw_createNoCollision(),
        distance = distance,
        angle = u_getPlayerAngle(),
        additionalAngle = math.random(0, 314) / 100,
        color = clone(mainColor),
        width = width or 0.2,
        height = height or 9,
        time = 0,
        distanceFromCenter = distanceFromCenter or 0,
        angleOffset = angleOffset or 0,
        timeIncMult = timeIncMult or 1,
    }
    table.insert(customWall.fakePlayerArrows, cw) -- Even though it's single it requires color pulse and change support.
end

function updateFakePlayerArrows(mFrameTime)
    for i = #customWall.fakePlayerArrows, 1, -1 do
        local cw = customWall.fakePlayerArrows[i]
        cw.angle = u_getPlayerAngle()
        cw.time = cw.time + mFrameTime / 140 * cw.timeIncMult * getNeg(l_getRotationSpeed()) * pulsemut
        cw_setVertexPos(cw.id, 0, getAbsolutePosition(
            cw.distance * math.cos(cw.angle + cw.additionalAngle) + cw.distanceFromCenter * math.cos(cw.time + cw.angleOffset),
             (cw.distance) * math.sin(cw.angle + cw.additionalAngle) + cw.distanceFromCenter * math.sin(cw.time + cw.angleOffset)
        ))
        cw_setVertexPos(cw.id, 1, getAbsolutePosition(
            (cw.distance - cw.height) * math.cos(cw.angle + cw.additionalAngle + cw.width) + cw.distanceFromCenter * math.cos(cw.time + cw.angleOffset), 
            (cw.distance - cw.height) * math.sin(cw.angle + cw.additionalAngle + cw.width) + cw.distanceFromCenter * math.sin(cw.time + cw.angleOffset)
        ))
        cw_setVertexPos(cw.id, 2, getAbsolutePosition(
            (cw.distance - cw.height) * math.cos(cw.angle + cw.additionalAngle - cw.width) + cw.distanceFromCenter * math.cos(cw.time + cw.angleOffset), 
            (cw.distance - cw.height) * math.sin(cw.angle + cw.additionalAngle - cw.width) + cw.distanceFromCenter * math.sin(cw.time + cw.angleOffset)
        ))
        cw_setVertexPos(cw.id, 3,  getAbsolutePosition(
            cw.distance * math.cos(cw.angle + cw.additionalAngle) + cw.distanceFromCenter * math.cos(cw.time + cw.angleOffset), 
            (cw.distance) * math.sin(cw.angle + cw.additionalAngle) + cw.distanceFromCenter * math.sin(cw.time + cw.angleOffset)
        ))
        cw_setVertexColor4Same(cw.id, s_getMainColor())
    end
end

function removeFakePlayerArrows()
    for i = #customWall.fakePlayerArrows, 1, -1 do
        cw = customWall.fakePlayerArrows[i]
        cw_destroy(cw.id)
        table.remove(customWall.fakePlayerArrows, i)
    end
end

---------------------------------------------------------
-- ROTATING CIRCLE
---------------------------------------------------------

function circleDecorationPart(side, THICKNESS, offsetDistance, distance, angle, timeIncMult, sides)
    local sides = sides or 6
    local cw = {
        id = cw_createNoCollision(),
        distance = distance or 0,
        offsetDistance = offsetDistance,
        firstAngle = side * math.pi / (sides / 2) + math.pi / sides,
        secondAngle = nil,
        THICKNESS = THICKNESS,
        xOffset = xOffset, yOffset = yOffset,
        time = 0,
        angleOffset = angle,
        timeIncMult = timeIncMult or 1,
    }
    cw.secondAngle = cw.firstAngle + 0.5 * math.pi / (sides / 2) + math.pi / sides
    table.insert(customWall.rotatingCircle, cw)
end

function updateCircles(mFrameTime)
    local function setPosition(cw)
        cw_setVertexPos(cw.id, 0, getAbsolutePosition(
            (cw.distance + cw.THICKNESS) * math.cos(cw.firstAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.cos(cw.time + cw.angleOffset),
            (cw.distance + cw.THICKNESS) * math.sin(cw.firstAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.sin(cw.time + cw.angleOffset)))
        cw_setVertexPos(cw.id, 1, getAbsolutePosition(
            (cw.distance + cw.THICKNESS) * math.cos(cw.secondAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.cos(cw.time + cw.angleOffset),
            (cw.distance + cw.THICKNESS) * math.sin(cw.secondAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.sin(cw.time + cw.angleOffset)))
        cw_setVertexPos(cw.id, 2, getAbsolutePosition(
            cw.distance * math.cos(cw.secondAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.cos(cw.time + cw.angleOffset),
            cw.distance * math.sin(cw.secondAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.sin(cw.time + cw.angleOffset)))
        cw_setVertexPos(cw.id, 3, getAbsolutePosition(
            cw.distance * math.cos(cw.firstAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.cos(cw.time + cw.angleOffset),
            cw.distance * math.sin(cw.firstAngle + cw.time + cw.angleOffset) + cw.offsetDistance * math.sin(cw.time + cw.angleOffset)))
        cw_setVertexColor4Same(cw.id, s_getMainColor())
	end
    for i = #customWall.rotatingCircle, 1, -1 do 
        local cw = customWall.rotatingCircle[i]
        cw.time = cw.time + mFrameTime / 140 * cw.timeIncMult * getNeg(l_getRotationSpeed()) * pulsemut
        setPosition(cw)
    end
end

function createRotatingCircle(THICKNESS, offsetDistance, distance, angle, timeIncM, sides) 
    local timeIncMult = math.random(-60, 60) / 100
    for i = 1, sides or 6 do circleDecorationPart(i, THICKNESS, offsetDistance, distance, angle, timeIncM or timeIncMult, sides) end 
end

function removeRotatingCircles(time, easing, rotationMult)
    for i = #customWall.rotatingCircle, 1, -1 do
        cw = customWall.rotatingCircle[i]
        cw_destroy(cw.id)
        table.remove(customWall.rotatingCircle, i)
    end
end

-- fake walls

fekjer = ct_create()
fakew_tihck = 20
fakew_sides = 6

fakewp_sync = 120

--[[
012345
======
]]

function tkick(sync)
	return (PW[0].speed:get() * 5) * (sync * FRAMES_PER_SECOND)
end

function fWall(s, e, m, t)
	for i = 0, e, m do
		ct_eval(fekjer, ([[ PW[0][%d]:nWall(0, %d) ]]):format((s + i) % fakew_sides, t or fakew_tihck))
	end
end

function fDualHoled(s, t)
	fWall(s, 0, 1, t)
	fWall(s + 2, fakew_sides - (1 + 3), 1, t)
end

function fVorta(s, t)
	fWall(s, fakew_sides - (2 + math.ceil(fakew_sides / 2)), 1, t)
	fWall(s + math.ceil(fakew_sides / 2), fakew_sides - (2 + math.floor(fakew_sides / 2)), 1, t)
end

fakePatternsSpawnSyncTimer = 999999

fake_pattern = {
	-- barrage
	[0] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		for a = 0, 6 do
			fWall(t + (a * d) + 1, fakew_sides - 2, 1)
			ct_waitS(fekjer, getBPM(fakewp_sync))
		end
	end,
	[1] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		for a = 0, 6 do
			fWall(t + (a * d) + 1, fakew_sides - 1, 2)
			ct_waitS(fekjer, getBPM(fakewp_sync))
		end
	end,
	[2] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		for a = 0, 6 do
			fVorta(t + (a * d))
			ct_waitS(fekjer, getBPM(fakewp_sync))
		end
	end,
	-- cage
	[50] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		for a = 0, 10 do
			fWall(t + (a * d), math.floor(fakew_sides / 2) - 1, 1, tkick(getBPM(fakewp_sync * 10)))
			ct_waitS(fekjer, getBPM(fakewp_sync) / 2)
		end
	end,
	[51] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		for a = 0, 10 do
			fWall(t + (a * d), math.ceil(fakew_sides / 2) + 1, math.ceil(fakew_sides / 2), tkick(getBPM(fakewp_sync * 10)))
			ct_waitS(fekjer, getBPM(fakewp_sync) / 2)
		end
	end,
	[52] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		fWall(t, 0, 1, tkick(getBPM(fakewp_sync) * 1.2) + fakew_tihck)
		for a = 0, 2 do
			fWall(t + neg0(d) + 1, fakew_sides - 3, 1)
			d = -d
			ct_waitS(fekjer, getBPM(fakewp_sync) * 3)
		end
	end,
	[53] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		fWall(t, 0, 1, tkick(getBPM(fakewp_sync) * 1.2) + fakew_tihck)
		for a = 0, 3 do
			fWall(t + d + 2, fakew_sides - 4, 1)
			d = -d
			if a < 3 then
				ct_waitS(fekjer, getBPM(fakewp_sync) * 2)
			end
		end
	end,
	[54] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		fWall(t, 2, 1, tkick(getBPM(fakewp_sync) * 1.2) + fakew_tihck)
		for a = 0, 6 do
			if d > 0 then
				fWall(t + 3, 3, 2)
			else
				fWall(t + 4, 0, 1)
			end
			d = -d
			ct_waitS(fekjer, getBPM(fakewp_sync))
		end
	end,
	[55] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		fWall(t, fakew_sides - 1, 3, tkick(getBPM(fakewp_sync) * 1.2) + fakew_tihck)
		for a = 0, 6 do
			if d > 0 then
				fWall(t + 2, 3, 2)
			else
				fWall(t - 1, 3, 2)
			end
			d = -d
			ct_waitS(fekjer, getBPM(fakewp_sync))
		end
	end,
	-- swap
	[100] = function()
		local t, d = math.random(fakew_sides) - 1, rng_dir()

		--fWall(t + 1, math.ceil(fakew_sides / 2) - 2, 1)
		fWall(t, math.ceil(fakew_sides / 2) + 1, math.ceil(fakew_sides / 2), tkick(getBPM(fakewp_sync) * .8) + fakew_tihck)
		ct_waitS(fekjer, getBPM(fakewp_sync) * 4)
		fWall(t + 1 + math.ceil(fakew_sides / 2), math.floor(fakew_sides / 2) - 2, 1)
	end,
}

fake_pat_keys = { 1, 2, 50, 51, 52, 53, 54, 55, 100 }
shuffle(fake_pat_keys)
fake_pat_index = 1

function updateFakePatterns(mFrameTime)
	fakePatternsSpawnSyncTimer = fakePatternsSpawnSyncTimer - mFrameTime/60
	if fakePatternsSpawnSyncTimer < 0 then
		fakePatternsSpawnSyncTimer = getBPM(fakewp_sync) * 8
        if fake_pat_index > #fake_pat_keys then
            fake_pat_index = 1
            shuffle(fake_pat_keys)
        end
        
        fake_pattern[fake_pat_keys[fake_pat_index]]()
        fake_pat_index = fake_pat_index + 1
	end
end

function updateAllCustomWalls(mFrameTime)
    updatePulseLineWall(mFrameTime)
	updateFakePlayerArrows(mFrameTime)
	updateCircles(mFrameTime)
	updateFakePatterns(mFrameTime)
	updatePulseWalls(mFrameTime)
	updateLinerWall(mFrameTime)
	updateParticlesPtI(mFrameTime)
	updateParticlesPtII(mFrameTime)
end