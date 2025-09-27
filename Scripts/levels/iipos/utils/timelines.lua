function createEvents(timings, action, offset)
    local offset = offset or 0
    local timeline = ct_create()
    for _, i in ipairs(timings) do
		ct_waitUntilS(timeline, closeValue(offset + i - musicOffset, 0, 999, 'min'))
		ct_eval(timeline, action)
	end
end

local function ib(beat)
	return getBPM(130) * beat
end

timings = {
    function() -- kick calm
        local timings = {
			ib(32 * 3 + 16) - ib(1),
			ib(32 * 3 + 16),
			ib(32 * 3 + 16) + ib(5),
			ib(32 * 3 + 16) + ib(8),
		}
        createEvents(timings, [[
			beat(0)
        ]])
    end,
    function() -- snare calm
        local timings = {
			ib(32 * 3 + 16) + ib(2),
			ib(32 * 3 + 16) + ib(6),
			ib(32 * 3 + 16) + ib(10),
		}
        createEvents(timings, [[
			beat(2)
        ]])
    end,
    function() -- kick buildup
        local timings = {
			ib(32 * 5),
			ib(32 * 5) + ib(2),
			ib(32 * 5) + ib(4),
			ib(32 * 5) + ib(6),
			ib(32 * 5) + ib(8),
			ib(32 * 5) + ib(10),
			ib(32 * 5) + ib(12),
			ib(32 * 5) + ib(14),
			ib(32 * 5) + ib(16),
		}
        createEvents(timings, [[
			level.rot.mult = 7.5
        ]])
    end,
}