--[[
=== B A B A ' S   R E C R U S I V E   F U N C T I O N S ===
]]

-- baba

hasLeveledUp = u_hasIncremented;

function syncPulse(_tempo_input, _lvl_pul_spd, _lvl_pul_spd_r, _lvl_pul_dir, _rev_del)
    l_setSyncedPulse(0, _tempo_input, false, 0, false, nil, nil, _lvl_pul_spd, _lvl_pul_spd_r, _lvl_pul_dir, 0, 0, 0, 0, 0, _rev_del, true, nil)
end

function custWait(_delay_amount)          return customizePatternDelay(_delay_amount, true)         end
function custThickness(_thickness_amount) return customizePatternThickness(_thickness_amount, true) end

overrideDelay = p_setOverridePatternDelay;

function emergencyInvinciblity(_wait_amount, _duration_amount)
    mch_getEmergencyInvinciblity(_wait_amount, _duration_amount, nil)
end

function emergencyInvinciblityReset()
    mch_doEmergencyInvinciblityReset()
end

-- zirf

function allSide() return getProtocolSides() end
function halfSide() return math.floor(allSide() / 2) end
function polysSide(side) return math.floor(allSide() / side) end

function rDir() return (u_rndInt(0, 1) - 0.5) * 2 end
function rSide() return getRandomSide() end

function setSyncedPulse(_tempo_input, _lvl_pul_dir, _rev_del)
    l_setSyncedPulseInstant(0, _tempo_input, true, 0, nil, nil, nil, nil, _lvl_pul_dir, 0, 0, 0, 0, 0, _rev_del, true, nil)
end

function pulseActiveHeld() return l_isPulseActiveHeld(); end
function pulseActiveOnce() return l_isPulseActiveOnce(); end
pulseActive = pulseActiveOnce;

function pulseDetector(_beat_duration_amount)
    l_setPulseDetector(convertBPMtoSeconds(GLOBAL_TEMPO) * _beat_duration_amount, false, 0, true, nil)
end

function pulseDetectedHeld() return l_isPulseDetectedHeld(); end
function pulseDetectedOnce() return l_isPulseDetectedOnce(); end
pulseDetected = pulseDetectedOnce;

function levelUp(_spd_inc, _rot_inc, _del_inc)
    l_setSides(u_rndInt(l_getSidesMin(), l_getSidesMax()))
    u_forceManualIncrement(_rot_inc, _spd_inc, _del_inc)
end

function doLevelUps(_beat_duration_amount, _spd_inc, _rot_inc, _del_inc)
    u_doManualIncrements(convertBPMtoSeconds(GLOBAL_TEMPO) * _beat_duration_amount, _rot_inc, _spd_inc, _del_inc, true, nil)
end

hasLeveled = u_hasIncrementedManually;

local isDown = false
local invinc = 0

function enableSwap(mFrameTime, _, _, mSwap)
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
    invinc = convValue(mFrameTime, invinc, 0, 1)

    if invinc < 0.85 then
        l_setTutorialMode(false)
    else
        l_setTutorialMode(true)
    end
end

function zirfWait(_delay_amount)                 t_wait(customizeTempoPatternDelay(_delay_amount)) end
function zirfThickness(_thickness_amount) return customizeTempoPatternThickness(_thickness_amount) end

function zirfSyncFixUpdater(_beat_duration_amount, _beat_delay_amount)
    p_updateSyncedPatternRepair(_beat_duration_amount, _beat_delay_amount, false, nil, nil, nil)
end

function zirfWall(mSide, mThickness, ...)
    p_updateGlobalSyncedPatterns()
    w_wall(mSide, mThickness or THICKNESS)
end

function zirfWallEx(mSide, mThickness, mExtra, ...)
    for i = 1, mExtra, 1 do
        zirfWall(mSide + i, mThickness, ...)
    end
end

function zirfWallExM(mSide, mThickness, mExtra, mExtraMult, ...)
    for i = 0, mExtra - 1, 1 do
        zirfWall(mSide + i * mExtraMult, mThickness, ...)
    end
end
zirfWallExmul = zirfWallExM

function zirfWallGrow(mSide, mThickness, mExtra, ...)
    for i = -mExtra, mExtra, 1 do
        zirfWall(mSide + i, mThickness, ...)
    end
end

function zirfWallDraw(mSide, mThickness, mMin, mMax, ...)
    for i = mMin, mMax, 1 do
        zirfWall(mSide + i, mThickness, ...)
    end
end

function zirfBarrage(mSide, mThickness, ...)
    for i = 1, allSide() - 1 do
        zirfWall(i + mSide, mThickness, ...)
    end
end

function zirfAltBarrage(mSide, mThickness, ...)
    for i = 1, allSide(), 2 do
        zirfWall(i + mSide, mThickness, ...)
    end
end

function zirfHalf(mSide, mThickness, ...)
    for i = 1, halfSide(), 1 do
        zirfWall(i + mSide, mThickness, ...)
    end
end

function zirfMirrorStrip(mSide, mThickness, ...)
    zirfWall(mSide, mThickness, ...)
    zirfWall(mSide + halfSide(), mThickness, ...)
end

function zirfWallMirror(mSide, mThickness, mOffset, ...)
    for i = 0, mOffset - 1, 1 do zirfWall(mSide + math.floor(i * (allSide() / mOffset)), mThickness, ...); end
end

function zirfWallMirrorEx(mSide, mThickness, mExtra, mOffset, ...)
    for i = 0, mOffset - 1, 1 do zirfWallEx(mSide + math.floor(i * (allSide() / mOffset)) - 1, mThickness, mExtra + 1, ...); end
end

function zirfVorta(mSide, mThickness, ...)
    zirfWallEx(mSide, mThickness, math.floor(allSide() / 2) - 1, ...)
    zirfWallEx(mSide + halfSide(), mThickness, math.ceil(allSide() / 2) - 1, ...)
end

function zirfDoubleBarrage(mSide, mThickness, ...)
    for i = 2, allSide() - 2, 1 do
        zirfWall(i + mSide, mThickness, ...)
    end
    zirfWall(mSide, mThickness, ...)
end
