u_execScript("common.lua")
u_execScript("commonZirf.lua")
u_execScript("zirfPatternLogic.lua")
u_execScript("zirfPatterns.lua")


function addBasicPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		BarrageSpiral(3)

		dir = dir * -1
		
		zirfWait(.5)
		
		BarrageSpiral(4)
		
		zirfWait(1)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 12 do
			if l_getWallSkewLeft() ~= 0 then
				zirfWall(side, zirfThickness(0.3))
				zirfWall(side + dir, zirfThickness(0.3))
				zirfWall(side - dir, zirfThickness(0.1))
			else
				zirfHalf(side, zirfThickness(0.25))
			end
			side = side + dir
			zirfWait(0.25)
		end
		
		--HalfSpiral(12, zirfThickness(.25), 1, 0.5)
		
		zirfWait(2)
	
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		BarrageLeftRights(7, 1, 1)
		
		zirfWait(1)
	
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 7 do
			zirfVorta(side, 40)
			
			side = side + rDir()
			
			zirfWait(0.5)
		end
		
		zirfWait(1)
	
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		DoubleBarrageSpiral(7, 1, 1)
		
		zirfWait(1)
	
	elseif mKey == 6 then
		side = rSide()
		
		if allSide() % 2 == 0 then
			dir = halfSide()
		else
			dir = 3
		end
		
		for i = 1, 7 do
		
			if allSide() > 5 and allSide() % 2 == 1 then
				if i < 7 then
				zirfWall(side, zirfThickness(0.5))
				end
				if i > 1 then
				zirfWall(side, zirfThickness(-0.5))
				end
			end
			
			zirfHalf(side, 40)
			zirfWallEx(side - halfSide() + 1, 40, halfSide() - 2)
			side = side + dir
			
			zirfWait(0.5)
		end
		
		zirfWait(1)
	
	elseif mKey == 7 then
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
	
	elseif mKey == 8 then
		side = rSide()
		dir = rDir()
		
		AltRandom(7, 0.5, 0.5)
		
		zirfWait(1)
	
	elseif mKey == 9 then
		side = rSide()
		dir = rDir()
		
		sillyChance = 50
		
		for i = 1, 7 do
			zirfDoubleBarrage(side, 40)
		
			sillyChance = sillyChance * (math.random() * 1.5 + 1)
			
			if sillyChance > 100 then
				side = side + halfSide()
				sillyChance = sillyChance / 3
			else
				side = side + rDir()
			end
			
			zirfWait(0.5)
		end
		
		zirfWait(1)
	
	elseif mKey == 10 then
		side = rSide()
		dir = 0
		
		zirfWallEx(side + 1, zirfThickness(1.0) + 40, allSide() - 3)
		
		
		for i = 1, 3 do
			if i % 2 == 1 then
				zirfWallExmul(side - 1, 40, 2, 2)
			else
				zirfDoubleBarrage(side, 40)
			end
			
			if i < 3 then
			zirfWait(0.5)
			end
		end
		
		zirfWallEx(side, zirfThickness(1.0) + 40, math.floor(allSide() / 2) - 1)
		zirfWallEx(side - math.floor(allSide() / 2), zirfThickness(1.0) + 40, math.floor(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallEx(side + math.ceil(allSide() / 2), -40, allSide() - 3)
		zirfWait(0.5)
		zirfWallEx(side + 1, zirfThickness(1.0) + 40, allSide() - 3)
		
		for i = 1, 3 do
			if i % 2 == 1 then
				zirfWallExmul(side - 1, 40, 2, 2)
			else
				zirfDoubleBarrage(side, 40)
			end
			
			if i < 3 then
			zirfWait(0.5)
			end
		end
		
		
		zirfWait(1)
	
	elseif mKey == 11 then
		side = rSide()
		dir = rDir()
		
		if allSide() % 2 == 0 then
			zirfWallExmul(side + math.ceil(allSide() / 2 + 0.5) + 2, zirfThickness(3) - 20, 2, math.ceil(allSide() / 2) - 1)
			
			for i = 1, 4 do
				if i % 2 == 0 then
					zirfBarrage(side + 3 + (dir / 2 + 0.5) * (math.ceil(allSide() / 2 - 1.5)), -40)
					dir = dir * -1
				else
					zirfWallExmul(side + 2, -40, math.ceil(allSide() / 2 + 1.5), 1)
				end
				
				zirfWait(1)
			end
			
			zirfWait(1)
		end
	
	elseif mKey == 12 then
		side = rSide()
		dir = math.random(0, 1) * halfSide()
		
		zirfWallExmul(side, zirfThickness(3) + 40, math.floor(allSide() / 4), 1)
		zirfWallExmul(side + halfSide(), zirfThickness(3) + 40, math.floor(allSide() / 4), 1)
		
		sillyChance = 50
		
		for i = 1, 7 do
			zirfWallExmul(side - math.ceil(allSide() / 8) + dir, 40, math.ceil(allSide() / 2), 1)
			
			if allSide() % 2 == 0 then
				sillyChance = sillyChance * (math.random() * 1.5 + 1)
				
				if sillyChance > 100 then
					zirfWallExmul(side + math.random(0, 1) * halfSide(), 40, math.ceil(allSide() / 2), 1)
					
					sillyChance = sillyChance / 3
				end
			end
			
			dir = dir * -1 + halfSide()
			
			zirfWait(0.5)
		end
		
		zirfWait(4)
		
	elseif mKey == 13 then
		side = rSide()
		dir = rDir()
		
			for i = 1, 4 do
				if i < 4 then
					zirfWallExmul(side + dir, zirfThickness(1) + 40, 2, 2)
				end
				zirfBarrage(side + dir + 1, 40)
				dir = dir * -1
				zirfWait(1)
			end
			
		zirfWait(4)
		
	elseif mKey == 14 then
		side = rSide()
		dir = rDir()
		
		sillyChance = 50
		
		for i = 1, 7 do
			zirfBarrage(side, 40)
			
			zirfWait(0.25)
			
			sillyChance = sillyChance * (math.random() * 1.5 + 1)
			
			if sillyChance > 100 then
				if i < 7 then
					zirfVorta(side, 40)
					side = side + halfSide()
					sillyChance = sillyChance / 3
				end
			else
				side = side + rDir()
			end
			
			zirfWait(0.25)
		end
		
		zirfWait(2)
		
	elseif mKey == 15 then
		side = rSide()
		dir = rDir()
		
		theuniqueandquirkytable = { 1, rDir(), rDir(), 1, rDir(), rDir(), 1 }
		
		for i = 1, 7 do
			if theuniqueandquirkytable[i] > 0 then
				zirfBarrage(side, 40)
				dir = rDir()
			end
			
			side = side + dir
			zirfWait(0.5)
		end
		
		zirfWait(2)
		zirfWait(2)
		
	elseif mKey == 16 then
		side = rSide()
		dir = rDir()
		sideTable = { 1, 2, 3, 4, 5, 6 }
		shuffle(sideTable)
		
		for a = 1, 7 do
			for i = 1, 6 do
				if (sideTable[i] + a) % 6 + 1 == 3 and a < 7 then
					zirfWall(side + i, zirfThickness(0.5) + 40)
				elseif (sideTable[i] + a) % 6 + 1 > 3 then
					zirfWall(side + i, 40)
				end
			end
			side = side + dir
			zirfWait(0.5)
		end

		zirfWait(2)
	end
end

function addBasicKey()
keys = { 1, 2, 3, 4, 4, 5, 6, 7, 7, 8, 8, 9, 9, 10, 11, 12, 13, 14, 14, 15, 15, 16, 16 }
shuffle(keys)
index = 0
end

function addTripletPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		BarrageSpiral(2)

		dir = dir * -1
		
		zirfWait(.5)
		
		BarrageSpiral(3)
		
		zirfWait(1)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()

		zirfWall(side + 1, zirfThickness(2) + 40)
		AltRandom(5, 0.5, 0.5)
		
		zirfWait(1)
	
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		rand = 0.5
		
		for i = 1, 5 do
			for a = 1, allSide() do
				if dir < 0 then
					if a % 3 == 1 then
						zirfWall(a + side, 40)
					end
				else
					if a % 3 ~= 1 then
						zirfWall(a + side, 40)
					end
				end
			end
		
		if math.random() > rand then
			dir = dir * -1
			rand = 0.5
		end
			
			rand = rand * 0.5
			zirfWait(0.5)
		end
		

		zirfWait(1)
		
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 5 do
			zirfDoubleBarrage(side, 40)
			side = side + rDir()
				
			zirfWait(0.5)
		end
		
		zirfWait(1)
		
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		if allSide() > 6 then
			zirfWallEx(side + 4, 40, allSide() - 4)
			zirfWallExmul(side + 4, zirfThickness(2) + 40, 2, allSide() - 3)
			zirfWait(0.5)
			zirfWait(0.5)
			zirfWallEx(side + 1, 40, 2)
			zirfWallEx(side + 5, 40, allSide() - 6)
			zirfWait(0.5)
			zirfWait(0.5)
			zirfWallEx(side + 4, 40, allSide() - 4)
		else
			zirfWallEx(side + 4, 40, allSide() - 3)
			zirfWallExmul(side + 4, zirfThickness(2) + 40, 2, allSide() - 2)
			zirfWait(0.5)
			zirfWait(0.5)
			zirfWallEx(side + 1, 40, 3)
			zirfWallEx(side + 5, 40, allSide() - 5)
			zirfWait(0.5)
			zirfWait(0.5)
			zirfWallEx(side + 4, 40, allSide() - 3)
		end
		
		zirfWait(1)
		zirfWait(1)
		zirfWait(1)
		
	elseif mKey == 6 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 5 do
			if i % 2 == 1 then
				zirfBarrage(side, 40)
				
				side = side + dir
			else
				zirfWallEx(side + math.floor(dir * 0.5) + 1, 40, allSide() - 2)
				side = side + dir * 2
			end
			
			zirfWait(0.5)
		end
		
		zirfWait(12)
		
	elseif mKey == 7 then
		side = rSide()
		dir = rDir()
		
		zirfWallExmul(side, zirfThickness(2) + 40, math.ceil(allSide() / 3), 3)
		
		for i = 1, 5 do
			zirfWallExmul(side + dir, 40, math.ceil(allSide() / 3), 3)
			dir = dir * -1
			zirfWait(0.5)
		end
		
		zirfWait(33)
		
	elseif mKey == 8 then
		side = rSide()
		dir = rDir()
		
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallExmul(side, 40, 2, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side + math.floor(allSide() / 2), 40, math.ceil(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallExmul(side, 40, 2, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 1)
		
		zirfWait(33)
		
	elseif mKey == 9 then
		side = rSide()
		dir = rDir()
		
			zirfWallEx(side, 20, allSide() - 3)
			zirfWallEx(side - 3, zirfThickness(0.5) + 40, 1)
			zirfWallEx(side - 1, zirfThickness(0.5) + 40, 1)
			zirfWait(0.5)
			zirfWallEx(side - 2, 40, 1)
			zirfWait(0.5)
			zirfWallEx(side + 1, 20, allSide() - 5)
			zirfWallEx(side - 4, zirfThickness(0.5) + 40, 1)
			zirfWallEx(side, zirfThickness(0.5) + 40, 1)
			zirfWait(0.5)
			zirfWallEx(side - 3, 40, 3)
		
		zirfWait(33)
		
	elseif mKey == 10 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 9 do
			zirfMirrorStrip(side, zirfThickness(0.25))
			side = side + dir
			zirfWait(0.25)
		end
		
		zirfWait(33)
		
	elseif mKey == 11 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 5 do
			if i % 2 == 1 then
				filler()
			else
				zirfWall(side, zirfThickness(0.5) + 40)
				zirfWall(side + halfSide(), 40)
			end
			
			side = side + dir
			zirfWait(0.5)
		end
		
		zirfWait(5)
	
	end
end

function addTripletKey()
keys = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 6, 6, 7, 8, 8, 9, 9, 10, 11, 11 }
shuffle(keys)
index = 0
end


-- quint refers to either quintuplets (5 divisions of a beat) or more commonly, a time signature of 5/4
function addQuintPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()

		for i = 1, 9 do
			zirfBarrage(side, 40)
			
			side = side + dir
			dir = rDir()
			zirfWait(.5)
		end
		
		
		zirfWait(1)
	
	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		chance = 0.75
		
		zirfWallExmul(side, zirfThickness(4) + 40, math.ceil(allSide() / 3), 3)
		
		for i = 1, 9 do
			zirfWallExmul(side + dir, 40, math.ceil(allSide() / 3), 3)
			if math.random() * chance > 0.25 then
				dir = dir * -1
				chance = chance * 0.75
			else
				chance = chance * 2
			end
			zirfWait(0.5)
		end
		
		zirfWait(33)
		
	
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		WallExSpiral(16, zirfThickness(0.25) + 5, 1, 0.25, allSide() - 3)
		
		zirfWait(2)
	
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()

		for i = 1, 4 do
		VortaSpiral(2, 1)
		dir = dir * -1
		zirfWait(0.5)
		end
		zirfVorta(side, 40)
		
		zirfWait(1)
	
	
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		zirfWallExmul(side + math.ceil(allSide() / 2 + 0.5) + 2, zirfThickness(4) - 20, 2, math.ceil(allSide() / 2) - 1)
		
		for i = 1, 5 do
			if i % 2 == 0 then
				zirfBarrage(side + 3 + (dir / 2 + 0.5) * (math.ceil(allSide() / 2 - 1.5)), -40)
				dir = dir * -1
			else
				zirfWallExmul(side + 2, -40, math.ceil(allSide() / 2 + 1.5), 1)
			end
			
			zirfWait(1)
		end
		
		zirfWait(1)
	
	elseif mKey == 6 then
		side = rSide()
		dir = rDir()
		
		if allSide() < 7 then
			
			if allSide() == 6 then
				zirfWall(side + dir * 2, 40)
			end
			
			for i = 1, 9 do
				if i % 3 == 1 then
					zirfMirrorStrip(side, zirfThickness(1) + 10)
				else
					zirfMirrorStrip(side, 10)
				end
				
				if i % 3 == 0 and i < 9 then
					zirfMirrorStrip(side + dir, zirfThickness(0.5) + 40)
				else
					zirfMirrorStrip(side + dir, 40)
				end
				
				
				dir = dir * -1
				if i % 3 == 0 then
					side = side + dir
				end
				
				if allSide() == 6 then
					if i == 9 then
						zirfWall(side, 40)
					end
				end
				zirfWait(0.5)
			end
		else
		
			zirfWallExmul(side, zirfThickness(4) + 40, math.ceil(allSide() / 3), 3)
			
			for i = 1, 9 do
				zirfWallExmul(side + dir, 40, math.ceil(allSide() / 3), 3)
				dir = dir * -1
				zirfWait(0.5)
			end
		
		end
		
		zirfWait(3)
		
	elseif mKey == 7 then
		side = rSide()
		dir = rDir()
		
		for a = 1, 9 do
			zirfDoubleBarrage(side, 40)
			if a % 2 == 1 then
				side = side + dir
			else
				side = side + halfSide()
			end
			zirfWait(0.5)
		end
		
		zirfWait(3)
		
	elseif mKey == 8 then
		side = rSide()
		dir = rDir()
		
		for a = 1, 16 do
			zirfMirrorStrip(side, zirfThickness(0.25) + 5)
			
			if a % 4 == 0 then
				dir = dir * -1
			else
				side = side + dir
				
			end
			zirfWait(0.25)
		end
		
		zirfWait(5)
		
	elseif mKey == 9 then
		side = rSide()
		dir = rDir()
		
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallExmul(side, 40, 2, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side + math.floor(allSide() / 2), 40, math.ceil(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallExmul(side, 40, 2, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallExmul(side, 40, 2, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side + math.floor(allSide() / 2), 40, math.ceil(allSide() / 2) - 1)
		zirfWait(0.5)
		zirfWallExmul(side, 40, 2, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 1)
		zirfWait(0.5)
		
		zirfWait(5)
		
	elseif mKey == 10 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 9 do
			if i % 2 == 1 then
				filler()
			else
				zirfWall(side, zirfThickness(0.5) + 40)
				zirfWall(side + halfSide(), 40)
			end
			
			side = side + dir
			zirfWait(0.5)
		end
		
		zirfWait(5)
	
	elseif mKey == 11 then
		side = rSide()
		dir = rDir()
		
		AltRandom(9, 0.5, 0.75)
		
		zirfWait(5)
	end
end

function addQuintKey()
keys = { 1, 1, 2, 3, 4, 4, 5, 6, 7, 7, 8, 9, 9, 10, 10, 11, 11 }
shuffle(keys)
index = 0
end

-- quint refers to either quintuplets (5 divisions of a beat) or more commonly, a time signature of 5/4
function addSeptPattern(mKey)
	if mKey == 1 then
		side = rSide()
		dir = rDir()
		r = math.random(-2, 2)
		
		BarrageSpiral(math.floor(3 + r))
		
		dir = dir * -1
		r = r * -1 + 1.0
		zirfWait(0.5)
		
		AltBarrageSpiral(math.floor(2 + r), 0.5)

		
		zirfWait(33)

	elseif mKey == 2 then
		side = rSide()
		dir = rDir()
		chance = 1
		
		for i = 1, 6 do
			if allSide() % 2 == 0 then
				if math.random() * chance < 1 then
					zirfBarrage(side, 40)
					side = side + dir
					dir = rDir()
					chance = chance * 2
				else
					if i < 6 then
						zirfVorta(side, zirfThickness(0.5) + 40)
					end
					
					zirfBarrage(side, 20)
					side = side + halfSide()
					chance = 0.5
				end
			else
				zirfBarrage(side, 40)
				side = side + dir
				
				if math.random() * chance > 0.8 then
					side = side + dir
					dir = dir * -1
					chance = 0.5
				else
					chance = chance * 2
				end
			end
			
			zirfWait(0.5)
		end
		
		zirfWait(33)
		
	elseif mKey == 3 then
		side = rSide()
		dir = rDir()
		
		zirfWallExmul(side, zirfThickness(2.5) + 40, math.ceil(allSide() / 3), 3)
		
		for i = 1, 6 do
			zirfWallExmul(side + dir, 40, math.ceil(allSide() / 3), 3)
			dir = dir * -1
			zirfWait(0.5)
		end
		
		zirfWait(33)
		
	elseif mKey == 4 then
		side = rSide()
		dir = rDir()
		
		for a = 1, 6 do
			zirfDoubleBarrage(side, 40)
			if a % 2 == 1 then
				side = side + dir
			else
				side = side + halfSide()
			end
			zirfWait(0.5)
		end
		
		zirfWait(33)
		
	elseif mKey == 5 then
		side = rSide()
		dir = rDir()
		
		zirfWallEx(side, 40, math.ceil(allSide() / 2) - 2)
		zirfWallEx(side + math.ceil(allSide() / 2) - 1, 40, math.floor(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side + math.ceil(allSide() / 2) - 2, 40, math.floor(allSide() / 2) + 2)
		zirfWait(0.5)
		zirfWallEx(side, 40, math.ceil(allSide() / 2) - 2)
		zirfWallEx(side + math.ceil(allSide() / 2) - 1, 40, math.floor(allSide() / 2))
		zirfWait(0.5)
		
		side = side + math.ceil(allSide() / 2)
		
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 2)
		zirfWallEx(side + math.floor(allSide() / 2) - 1, 40, math.ceil(allSide() / 2))
		zirfWait(0.5)
		zirfWallEx(side + math.floor(allSide() / 2) - 2, 40, math.ceil(allSide() / 2) + 2)
		zirfWait(0.5)
		zirfWallEx(side, 40, math.floor(allSide() / 2) - 2)
		zirfWallEx(side + math.floor(allSide() / 2) - 1, 40, math.ceil(allSide() / 2))
		zirfWait(0.5)
		
		zirfWait(33)
		
	elseif mKey == 6 then
		side = rSide()
		dir = rDir()
		
		if globalTempo < 150 then
			for i = 1, 10 do
				zirfMirrorStrip(side, zirfThickness(0.25))
				side = side + dir
				zirfWait(0.25)
			end
		else
			for i = 1, 5 do
				zirfMirrorStrip(side, zirfThickness(0.5))
				side = side + dir
				zirfWait(0.5)
			end
		end

		zirfWait(33)
		
	elseif mKey == 7 then
		side = rSide()
		dir = rDir()
		
		BarrageLeftRights(6, 1, 1)
		
		zirfWait(33)
		
	elseif mKey == 8 then
		side = rSide()
		dir = rDir()
		
		WallExSpiral(10, zirfThickness(0.25) + 2, 1, 0.25, halfSide())
		
		zirfWait(33)
		
	elseif mKey == 9 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 6 do
			if i < 6 then
				zirfWall(side, zirfThickness(0.5) + 3)
			end
			
			zirfWall(side + dir, 40)
			zirfWall(side + dir * 2, 40)
			
			side = side + dir * 2
			
			zirfWait(0.5)
		end
		
		zirfWait(33)
		
	elseif mKey == 10 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 6 do
			if i % 2 == 1 then
				filler()
			else
				if i < 6 then
					zirfWall(side, zirfThickness(0.5) + 40)
				end
				zirfWall(side + halfSide(), 40)
			end
			
			side = side + dir
			zirfWait(0.5)
		end
		
		zirfWait(5)
	
	elseif mKey == 11 then
		side = rSide()
		dir = rDir()
		
		for i = 1, 6 do
			zirfDoubleBarrage(side, 40)
			side = side + rDir()
			zirfWait(0.5)
		end
		
		zirfWait(5)
		
	elseif mKey == 12 then
		side = rSide()
		dir = rDir()
		
		AltRandom(6, 0.5, 0.5)
		
		zirfWait(5)
	end
end

function addSeptKey()
keys = { 1, 1, 2, 2, 3, 4, 4, 5, 5, 6, 7, 7, 8, 9, 10, 10, 11, 11, 12, 12 }
shuffle(keys)
index = 0
end
