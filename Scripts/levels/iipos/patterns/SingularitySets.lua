u_execScript("common.lua")
u_execScript("commonZirf.lua")
u_execScript("zirfPatternLogic.lua")
u_execScript("zirfPatterns.lua")


function addBlockedPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		for a = 0, 6 do
			for i = 0, 5 do
				if i ~= (a % 2) and i ~= ((a - 3) % 4) + 2 then
				zirfWall(side + i * dir, 40)
				end
			end
			
			if a == 0 or a == 6 then
				zirfWall(side, 40)
			end
			
			zirfWait(0.5)
		end
		
		zirfWait(2)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 6 do
			for i = 0, 5 do
				if i ~= (a % 6) and i ~= (-a % 6) then
				zirfWall(side + i, 40)
				end
			end
			zirfWait(0.5)
		end
		
		zirfWait(2)
		
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 6 do
			for i = 0, 5 do
				if i ~= (a % 6) and i ~= ((a * 2) % 6) then
				zirfWall(side + i * dir, 40)
				end
			end
			zirfWait(0.5)
		end
		
		zirfWait(2)
		
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 6 do
			zirfMirrorStrip(side + dir, 40)
			zirfMirrorStrip(side - dir + 1, 40)
			
			if a % 2 == 0 and a < 6 then
				zirfWall(side - 1, zirfThickness(0.5) + 40)
				zirfWall(side - 1 + dir, zirfThickness(1) + 40)
				side = side + 3
			end
			
			dir = dir * -1
			zirfWait(0.5)
		end
		
		zirfWait(2)
		
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		zirfWall(side, zirfThickness(3.2))
		
		for a = 1, 3 do
			zirfBarrage(side + dir, zirfThickness(0.2))
			
			dir = dir * -1
			zirfWait(1.5)
		end

		zirfWait(2)
		
	elseif mKey == 6 then
		side = rSide()
		dir = rDir()
		
		for a = 1, 7 do
			zirfDoubleBarrage(side, 40)
			
			side = side + dir
			
			zirfWait(0.5)
		end

		zirfWait(2)
		
	elseif mKey == 7 then
		side = rSide()
		dir = math.random(0, 2)
		
		for a = 1, 7 do
			if a % 2 == 1 then
				if a ~= 7 then
					zirfHalf(side, zirfThickness(0.5))
				else
					zirfHalf(side, 40)
				end
			
				side = side + 3
				
				zirfWall(side + 1 + (dir) % 3, 40)
				zirfWall(side + 1 + (dir + 1) % 3, 40)
				dir = math.random(0, 2)
			end
			
			zirfWait(0.5)
		end

		zirfWait(2)
	end
end

function addBlockedKey()
keys = { 1, 1, 2, 2, 3, 3, 4, 5, 6, 6, 7 }
shuffle(keys)
index = 0
end


function addAnnoyingPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		zirfMirrorStrip(side, zirfThickness(3) + 40)
		
		for a = 1, 7 do
			zirfVorta(side + dir, 40)
			
			dir = dir * -1
			
			if a % 3 == 2 then
				zirfWall(side + dir, zirfThickness(0.5) + 40)
			end
			
			zirfWait(0.5)
		end
		
		zirfWait(1)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 6 do
			for i = 0, 5 do
				if i ~= (a % 6) and i ~= (-a % 6) then
				zirfWall(side + i, 40)
				end
			end
			zirfWait(0.5)
		end
		
		zirfWait(2)
		
	end
end

function addAnnoyingKey()
keys = { 1, 1 }
shuffle(keys)
index = 0
end

function addInterlacedPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		for a = 0, 5 do
			zirfWallExmul(side, 40, 3, 3)
			zirfWallExmul(side + 1, 40, 3, 3)
			
			side = side + dir
			zirfWait(0.5)
		end
		
		zirfWait(5)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		
			zirfWall(side - 4, zirfThickness(2.5) + 40)
		
		for a = 0, 5 do
			zirfBarrage(side + dir * 0.5 + 0.5, 40)
			
			dir = dir * -1
			zirfWait(0.5)
		end
		
		zirfWait(5)
		
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 10 do
			zirfWallExmul(side, zirfThickness(0.25) + 10, 3, 3)
			
			side = side + dir
			zirfWait(0.25)
		end
		
		zirfWait(5)
		
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()
		
		DoubleBarrageSpiral(5, 1, 1)
		
		zirfWait(5)
		
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 5 do
				for i = 1, 9 do
					if i ~= (a % 2) * dir + 2 and i ~= (a % 2) * -dir + 5 then
						zirfWall(side + i, 40)
					end
				end
			
			zirfWait(0.5)
		end
		
		zirfWait(5)
		
		
	end
end

function addInterlacedKey()
keys = { 1, 1, 2, 2, 3, 4, 4, 5, 5 }
shuffle(keys)
index = 0
end
function addStrangePattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		for a = 1, 6 do
			zirfVorta(side, 40)
			
			side = side + 1.5
			zirfWait(0.5)
		end
		
		zirfWait(5)
	
	elseif mKey == 2 then
		side = rSide()
		dir = 0
		
	--	zirfMirrorStrip(side, zirfThickness(1.5) + 40)
		
		for a = 1, 6 do
			zirfAltBarrage(side + dir + 0.5, 40)
			
			if a % 2 == 1 then
				if a == 5 then
					zirfMirrorStrip(side + 1.5, zirfThickness(0.5) + 40)
				else
					zirfMirrorStrip(side + 1.5, zirfThickness(1) + 40)
				end
				side = side + 1.5
				dir = dir - 1.5
			end
			
			dir = dir + 1
			zirfWait(0.5)
		end
		
		zirfWait(5)
		
		
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		zirfWallExmul(side + 2.5 - dir * 1.5, zirfThickness(2.5) + 40, 1, 1)
		
		for a = 1, 6 do
			zirfWallExmul(side - 0.25 - dir * 0.25, 40, 2.5 + dir * 0.5, 1.75 - dir * 0.25)
			zirfWallExmul(side - 2.5, 40, 2, 1)
			if dir < 0 then
			zirfWallExmul(side + 1, 40, 1, 1)
			end
			
			side = side + 3
			dir = dir * -1
			zirfWait(0.5)
		end
		
		zirfWait(5)
	end
end

function addStrangeKey()
keys = { 1, 1, 1, 2, 3, 3 }
shuffle(keys)
index = 0
end

function addSquarePattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		for a = 1, 7 do
			if math.random(1, 3) ~= 1 then
				zirfBarrage(side, 40)
				side = side + rDir()
			else
			zirfBarrage(side, 40)
				if a < 7 then
				zirfMirrorStrip(side + 1, zirfThickness(0.5) + 40)
				end
			side = side + 2
			end
			
			
			zirfWait(0.5)
		end
		
		zirfWait(2)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		
		AltRandom(7, 0.5, 0.5)
		
		zirfWait(2)
		
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		for a = 1, 13 do
			zirfWall(side, zirfThickness(0.25) + 5)
			side = side + dir
			
			if a % 4 == 0 then
				dir = dir * -1
			end
			
			zirfWait(0.25)
		end
		
		zirfWait(2)
		
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 7 do
			if i % 2 == 1 then
				filler()
			else
				zirfWall(side, zirfThickness(0.5) + 40)
				zirfWall(side + halfSide(), 40)
			end
			
			side = side + dir
			zirfWait(0.5)
		end
		
		zirfWait(1)
	
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		for a = 0, 6 do
			for i = 0, 3 do
				if i ~= (a % 4) and i ~= (-a % 4) then
				zirfWall(side + i, 40)
				end
			end
			zirfWait(0.5)
		end
		
		zirfWait(2)
		
	elseif mKey == 6 then
		side = rSide()
		dir = math.random(1, 3)
		oldDir = dir
		
		for a = 1, 7 do
			if a < 7 then
			zirfWall(side, zirfThickness(0.5) + 40)
			end
			zirfBarrage(side + dir, 40)
			
			while dir == oldDir do
				dir = math.random(1, 3)
			end
			
			if math.abs(dir - oldDir) == 2 and a < 7 then
				side = side + 2
				dir = oldDir
				zirfWall(side, zirfThickness(0.5) + 40)
			end
			
			oldDir = dir
		
			zirfWait(0.5)
		end
		
		zirfWait(2)
	end
end

function addSquareKey()
keys = { 1, 1, 2, 2, 3, 4, 4, 5, 5, 6 }
shuffle(keys)
index = 0
end
