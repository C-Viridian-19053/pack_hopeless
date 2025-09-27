chunkSide = 0
horoSideStuff = 0

function HorogonPatterns(mKey)
	if mKey == 1 then
	horoSideStuff = math.random(0, 1) * 0.5
	
	for i = 0, 2 do
		zirfWall(0, zirfThickness(0.5) + 40, i * zirfThickness(1) + zirfThickness(horoSideStuff))
	end
		
		chunkSide = chunkSide + 1
	
	elseif mKey == 2 then
	horoSideStuff = math.random(0, 3) * 2
	
	for a = 0, 6 do
		for i = 0, 1 do
			zirfWall((i + horoSideStuff) % 8, 40, a * zirfThickness(0.5))
			zirfWall((i + 4 + horoSideStuff) % 8, 40, a * zirfThickness(0.5))
		end
		horoSideStuff = math.random(0, 3) * 2
	end
	
		chunkSide = chunkSide + 8
	
	elseif mKey == 3 then
	horoSideStuff = rDir()
	
	zirfWall(0, zirfThickness(3) + 40, 0)
	zirfWall(3, zirfThickness(3) + 40, 0)
	
	for a = 0, 6 do
		zirfWall(horoSideStuff % 3, 40, a * zirfThickness(0.5))
		horoSideStuff = horoSideStuff * -1
	end
	
		chunkSide = chunkSide + 4
	
	elseif mKey == 4 then
	horoSideStuff = math.random(0, 5)
	
	for a = 0, 6 do
		for i = 1, 3 do
			zirfWall((horoSideStuff + i + a * 3) % 6, 40, a * zirfThickness(0.5))
		end
	end
	
		chunkSide = chunkSide + 6
	
	elseif mKey == 5 then
	horoSideStuff = rDir()
	
		zirfWall(0, zirfThickness(3) + 40, 0)
		zirfWall(5, zirfThickness(3) + 40, 0)
		
		for a = 0, 3 do
			for i = 1, 3 do
				zirfWall((i + horoSideStuff * 0.5 + 0.5), 40, zirfThickness(a))
			end
			
			horoSideStuff = horoSideStuff * -1
		end
		
	chunkSide = chunkSide + 6
	
	elseif mKey == 6 then
	horoSideStuff = math.random(-1, 0)
	dir = horoSideStuff * 2 + 1
	
	for a = 0, 12 do
		zirfWall((horoSideStuff + a * dir) % 14, zirfThickness(3) - zirfThickness(a * 0.25) + 40, zirfThickness(a * 0.25))
		if a % 2 == 0 then
			for i = 1, math.max(3 - a * 0.5, 2) do
				zirfWall((horoSideStuff + a * dir * 0.5 + 7 * dir + i * 2 * dir) % 14, 40, zirfThickness(a * 0.25))
			end
		end
	end
	
	chunkSide = chunkSide + 14
	
	elseif mKey == 7 then
	horoSideStuff = math.random(0, 1)
	
	for a = 0, 6 do
		zirfWall((a + horoSideStuff) % 2, 40, zirfThickness(a * 0.5))
	end
	
	chunkSide = chunkSide + 2
	
	elseif mKey == 8 then
	horoSideStuff = rDir() * 1.5
	
	for a = 0, 3 do
		for i = 1, 4 do
			zirfWall((i + horoSideStuff - 0.5) % 5, 40, zirfThickness(a * 1))
		end
		horoSideStuff = horoSideStuff * -1
	end
	
	chunkSide = chunkSide + 5
	
	elseif mKey == 9 then
	horoSideStuff = 0
	extrastuff = rDir()
	dir = extrastuff
	
	for a = 0, 12 do
		zirfWall(((extrastuff * -1.5 - 0.5) + horoSideStuff) % 8, zirfThickness(0.25), zirfThickness(a * 0.25))
		zirfWall(((extrastuff * -0.5 - 0.5) + horoSideStuff) % 8, zirfThickness(0.25), zirfThickness(a * 0.25))
		zirfWall(((extrastuff * 0.5 - 0.5) + horoSideStuff) % 8, zirfThickness(0.25), zirfThickness(a * 0.25))
		zirfWall(((extrastuff * 3.5 - 0.5) + horoSideStuff) % 8, zirfThickness(0.25), zirfThickness(a * 0.25))
		zirfWall(((extrastuff * 4.5 - 0.5) + horoSideStuff) % 8, zirfThickness(0.25), zirfThickness(a * 0.25))
		zirfWall(((extrastuff * 5.5 - 0.5) + horoSideStuff) % 8, zirfThickness(0.25), zirfThickness(a * 0.25))
		
		horoSideStuff = horoSideStuff + dir
		if a % 4 == 3 then
			dir = dir * -1
		end
	end
	
	chunkSide = chunkSide + 8
	
	elseif mKey == 10 then
	horoSideStuff = 0
	
	for a = 0, 6 do
		if a % 2 == 0 then
			zirfWall(2, 40, zirfThickness(a * 0.5))
		else
			zirfWall(0, 40, zirfThickness(a * 0.5))
			zirfWall(1, 40, zirfThickness(a * 0.5))
			zirfWall(3, 40, zirfThickness(a * 0.5))
			zirfWall(4, 40, zirfThickness(a * 0.5))
		end
	end
	
	chunkSide = chunkSide + 5
	
	elseif mKey == 11 then
	horoSideStuff = 0
	
	for a = 0, 6 do
		zirfWall(0, 40, zirfThickness(a * 0.5))
		zirfWall(8, 40, zirfThickness(a * 0.5))
	end
	
	zirfWall(1, 40, zirfThickness(0.5))
	zirfWall(7, 40, zirfThickness(0.5))
	
	zirfWall(1, 40, zirfThickness(1.0))
	zirfWall(2, 40, zirfThickness(1.0))
	zirfWall(6, 40, zirfThickness(1.0))
	zirfWall(7, 40, zirfThickness(1.0))
	
	zirfWall(1, 40, zirfThickness(1.5))
	zirfWall(2, 40, zirfThickness(1.5))
	zirfWall(3, 40, zirfThickness(1.5))
	zirfWall(5, 40, zirfThickness(1.5))
	zirfWall(6, 40, zirfThickness(1.5))
	zirfWall(7, 40, zirfThickness(1.5))
	
	zirfWall(1, 40, zirfThickness(2.0))
	zirfWall(2, 40, zirfThickness(2.0))
	
	zirfWall(4, 40, zirfThickness(2.0))
	
	zirfWall(6, 40, zirfThickness(2.0))
	zirfWall(7, 40, zirfThickness(2.0))
	
	zirfWall(1, 40, zirfThickness(2.5))
	
	zirfWall(3, 40, zirfThickness(2.5))
	zirfWall(4, 40, zirfThickness(2.5))
	zirfWall(5, 40, zirfThickness(2.5))
	
	zirfWall(7, 40, zirfThickness(2.5))
	
	zirfWall(2, 40, zirfThickness(3))
	zirfWall(3, 40, zirfThickness(3))
	zirfWall(4, 40, zirfThickness(3))
	zirfWall(5, 40, zirfThickness(3))
	zirfWall(6, 40, zirfThickness(3))
	
	chunkSide = chunkSide + 9
	
	elseif mKey == 12 then
		horoSideStuff = rDir()
	
	for a = 0, 3 do
		zirfWall(1 + horoSideStuff, 40, zirfThickness(a))
		zirfWall(1, 40, zirfThickness(a))
		horoSideStuff = horoSideStuff * -1
	end
	
	chunkSide = chunkSide + 3
	
	elseif mKey == 13 then
	
	zirfWall(0, zirfThickness(3) + 40, 0)
	zirfWall(2, zirfThickness(3) + 40, 0)
	zirfWall(-5, 40, zirfThickness(3.5))
	zirfWall(-2, 40, zirfThickness(3.5))
	zirfWall(1, 40, zirfThickness(3.5))
	zirfWall(4, 40, zirfThickness(3.5))
	zirfWall(7, 40, zirfThickness(3.5))
	
		
	chunkSide = chunkSide + 3
	
	elseif mKey == 14 then
		extrastuff = { 1, 2, 3, 4 }
		horoSideStuff = extrastuff[math.random(1, #extrastuff)]
	
		zirfWall(0, zirfThickness(3) + 40, 0)
		zirfWall(4, zirfThickness(3) + 40, 0)
		
		for a = 0, 6 do
			if horoSideStuff == 1 then
				extrastuff = { 2, 4 }
				zirfWall(1, 40, zirfThickness(a * 0.5))
				zirfWall(2, 40, zirfThickness(a * 0.5))
			elseif horoSideStuff == 2 then
				extrastuff = { 4 }
				zirfWall(2, 40, zirfThickness(a * 0.5))
			elseif horoSideStuff == 3 then
				extrastuff = { 2, 4 }
				zirfWall(2, 40, zirfThickness(a * 0.5))
				zirfWall(3, 40, zirfThickness(a * 0.5))
			elseif horoSideStuff == 4 then
				extrastuff = { 1, 2, 3 }
				zirfWall(1, 40, zirfThickness(a * 0.5))
				zirfWall(3, 40, zirfThickness(a * 0.5))
			end
			horoSideStuff = extrastuff[math.random(1, #extrastuff)]
		end
		
		chunkSide = chunkSide + 5
	
	elseif mKey == 15 then
		
		zirfWall(1, 40, zirfThickness(0))
		zirfWall(2, 40, zirfThickness(0))
		zirfWall(3, 40, zirfThickness(0))

		zirfWall(0, 40, zirfThickness(0.5))
		zirfWall(2, 40, zirfThickness(0.5))
		zirfWall(4, 40, zirfThickness(0.5))

		zirfWall(0, 40, zirfThickness(1))
		zirfWall(1, 40, zirfThickness(1))
		zirfWall(3, 40, zirfThickness(1))
		zirfWall(4, 40, zirfThickness(1))

		zirfWall(0, 40, zirfThickness(1.5))
		zirfWall(2, 40, zirfThickness(1.5))
		zirfWall(4, 40, zirfThickness(1.5))

		zirfWall(1, 40, zirfThickness(2))
		zirfWall(2, 40, zirfThickness(2))
		zirfWall(3, 40, zirfThickness(2))

		zirfWall(0, 40, zirfThickness(2.5))
		zirfWall(2, 40, zirfThickness(2.5))
		zirfWall(4, 40, zirfThickness(2.5))
		
		zirfWall(0, 40, zirfThickness(3))
		zirfWall(1, 40, zirfThickness(3))
		zirfWall(3, 40, zirfThickness(3))
		zirfWall(4, 40, zirfThickness(3))


		chunkSide = chunkSide + 5
	
	end
end

function HorogonKey()
keys = { 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 4, 5, 5, 6, 7, 7, 8, 8, 8, 9, 10, 10, 10, 11, 12, 12, 13, 14, 14, 15, 15 }
shuffle(keys)
index = 0
end

function CyclesKey()
keys = { 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 4, 5, 5, 7, 7, 8, 8, 8, 9, 10, 10, 10, 11, 12, 12, 13, 14, 14, 15, 15 }
shuffle(keys)
index = 0
end





chunkcheck = 0

function HypogonPatterns(mKey)
	if mKey == 1 then
		dir = rDir()
	
		waitxd = 0
		zirfWall(1, 3, waitxd, 1, 1, 3)
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		zirfWall(0, 1, waitxd, 1, 1, 3)
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		zirfWall(1, 3, waitxd, 1, 1, 3)
		zirfWall(2, 1, waitxd, 1, 1, 3)
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		chunkSide = chunkSide + 3
	
	elseif mKey == 2 then
		dir = rDir()
		
		waitxd = 0
		zirfWall(0, 3, waitxd, 1, 1, 7)
		zirfWall(1, 1, waitxd, 1, 1, 7)
		zirfWall(6, 4, waitxd, 1, 1, 7)
		
		waitxd = waitxd + 1
		zirfWall(3, 1, waitxd, 2, 1, 7)
		waitxd = waitxd + 1
		zirfWall(2, 1, waitxd, 1, 1, 7)
		zirfWall(3, 1, waitxd, 1, 1, 7)
		waitxd = waitxd + 1
		zirfWall(3, 1, waitxd, 2, 2, 7)
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		zirfWall(0, 1, waitxd, 1, 1, 7)
		zirfWall(2, 1, waitxd, 4, 1, 7)
		waitxd = waitxd + 1
		zirfWall(2, 1, waitxd, 1, 1, 7)
		waitxd = waitxd + 1
		zirfWall(2, 1, waitxd, 1, 1, 7)
	
		chunkSide = chunkSide + 7
		
	elseif mKey == 3 then
		dir = rDir()
		
		waitxd = 0
		zirfWall(0, 6, waitxd, 1, 1, 4)
		zirfWall(3, 3, waitxd, 1, 1, 4)
		zirfWall(1, 1, waitxd, 1, 1, 4)
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		zirfWall(2, 1, waitxd, 1, 1, 4)
		waitxd = waitxd + 1
		waitxd = waitxd + 1
		zirfWall(1, 1, waitxd, 1, 1, 4)
		waitxd = waitxd + 1
		zirfWall(3, 3, waitxd, 1, 1, 4)
		waitxd = waitxd + 1
		zirfWall(2, 1, waitxd, 1, 1, 4)
		waitxd = waitxd + 1
		
		chunkSide = chunkSide + 4
	end
	
	if chunkSide == chunkcheck then
		chunkSide = chunkSide + 15
	end
	
	chunkcheck = chunkSide
end

function HypogonKey()
keys = { 1, 2, 3 }
shuffle(keys)
index = 0
end

chunkSide = 0
horoSideStuff = 0

function DualPatterns(mKey)
	if mKey == 1 then
		horoSideStuff = rDir()
		uP = rDir()
		uPdir = rDir()
		
		zirfWall(1, zirfThickness(1) + 40, zirfThickness(1), uPdir)
		zirfWall(2, zirfThickness(1) + 40, zirfThickness(1), uPdir)
		zirfWall(3, zirfThickness(1) + 40, zirfThickness(1), uPdir)
		zirfWall(2 - horoSideStuff * uPdir * uP, zirfThickness(1) + 40, 0, -1)
		zirfWall(2 - horoSideStuff * uPdir * uP, zirfThickness(1) + 40, 0, 1)
	
		zirfWall(0, zirfThickness(3) + 40, 0, -uP)
		zirfWall(4, zirfThickness(3) + 40, 0, -uP)
		
		zirfWall(0, zirfThickness(3) + 40, 0, uP)
		zirfWall(4, zirfThickness(3) + 40, 0, uP)
		
		for a = 0, 3 do
			zirfWall(2 + horoSideStuff, 40, zirfThickness(a), -uP)
			zirfWall(2 - horoSideStuff, 40, zirfThickness(a), uP)
			if a % 2 == 0 then
				zirfWall(2, zirfThickness(1) + 40, zirfThickness(a), -uP)
				zirfWall(2, zirfThickness(1) + 40, zirfThickness(a), uP)
			end
			horoSideStuff = horoSideStuff * -1
		end
		
		chunkSide = chunkSide + 5
	
	elseif mKey == 2 then
		horoSideStuff = math.random(0, 1) * 2
		uP = rDir()
		dir = math.random(0, 1) * 2
		uPdir = rDir()
	
		for a = 0, 6 do
			if math.random(0, 2) <= 1 then
				zirfWall((0 + dir) % 4, 40, zirfThickness(a * 0.5), uPdir)
				zirfWall((1 + dir) % 4, 40, zirfThickness(a * 0.5), uPdir)
			end
			
			dir = math.random(0, 1) * 2
			uPdir = rDir()
			
			zirfWall((0 + horoSideStuff) % 4, 40, zirfThickness(a * 0.5), 0)
			zirfWall((1 + horoSideStuff) % 4, 40, zirfThickness(a * 0.5), 0)
			zirfWall((2 + horoSideStuff) % 4, 40, zirfThickness(a * 0.5), 1)
			zirfWall((3 + horoSideStuff) % 4, 40, zirfThickness(a * 0.5), 1)
			horoSideStuff = horoSideStuff + 2
		end
			
		chunkSide = chunkSide + 4
		
	elseif mKey == 3 then
		horoSideStuff = 1
		uP = rDir()
		
		for a = 0, 6 do
			for i = 0, 2 do
				zirfWall(i, 40, a * zirfThickness(0.5), uP)
			end
			if math.random() * horoSideStuff > 0.825 then
				uP = uP * -1
				horoSideStuff = 1
			end
			horoSideStuff = horoSideStuff * 2
		end
		
		chunkSide = chunkSide + 3
		
	elseif mKey == 4 then
		horoSideStuff = math.random(0, 1)
		uP = rDir()
		
		for i = 0, 6 do
			zirfWall((horoSideStuff + i) % 2, 40, i * zirfThickness(0.5), uP)
			zirfWall(0, 40, i * zirfThickness(0.5), -uP)
			zirfWall(1, 40, i * zirfThickness(0.5), -uP)
		end
		
		chunkSide = chunkSide + 2
	end
end

function DualKey()
keys = { 1, 1, 2, 2, 3, 3, 4, 4, 4 }
shuffle(keys)
index = 0
end



function DashPatterns(mKey)
	if mKey == 1 then
	horoSideStuff = 0
	
	for a = 0, 6 do
		zirfWall(0, 40, zirfThickness(a * 0.5))
	end
	
	chunkSide = chunkSide + 1
	
	elseif mKey == 2 then
	horoSideStuff = math.random(1, 3)
	oldhoroSideStuff = horoSideStuff
	dir = math.random(0, 1)
	
		zirfWall(0, zirfThickness(3) + 40, 0)
		zirfWall(5, zirfThickness(3) + 40, 0)
		
	for i = 0, 6 do
		if horoSideStuff == 1 then
			dir = dir * -1 + 1
			zirfWall(1 + dir, 40, zirfThickness(i * 0.5))
			zirfWall(2 + dir, 40, zirfThickness(i * 0.5))
			zirfWall(3 + dir, 40, zirfThickness(i * 0.5))
		elseif horoSideStuff == 2 then
			dir = math.random(0, 1)
			zirfWall(2, 40, zirfThickness(i * 0.5))
			zirfWall(3, 40, zirfThickness(i * 0.5))
		elseif horoSideStuff == 3 then
			dir = dir * -1 + 1
			zirfWall(1 + dir, 40, zirfThickness(i * 0.5))
			zirfWall(3 + dir, 40, zirfThickness(i * 0.5))
		end
		oldhoroSideStuff = horoSideStuff
		
		while horoSideStuff == oldhoroSideStuff do
			horoSideStuff = math.random(1, 3)
		end
	end
		
		chunkSide = chunkSide + 6
	
	elseif mKey == 3 then
	horoSideStuff = math.random(0, 3) * 2 + 1
	dir = rDir()
	
	for a = 0, 6 do
		for i = 1, 4 do
		zirfWall((i + horoSideStuff) % 8, 40, zirfThickness(a * 0.5))
		end
	horoSideStuff = horoSideStuff + 2 * dir
	end
		
		chunkSide = chunkSide + 8
	
	elseif mKey == 4 then
	horoSideStuff = 0
	dir = rDir()
	
		zirfWall(0, 40, 0)
		zirfWall(1, 40, 0)
		zirfWall(2, 40, 0)
		zirfWall(3, zirfThickness(0.5) + 40, 0)
		zirfWall(5, zirfThickness(0.5) + 40, 0)
		zirfWall(6, 40, 0)
		zirfWall(7, 40, 0)
		zirfWall(8, 40, 0)
		
		zirfWall(0, zirfThickness(2) + 40, zirfThickness(0.5))
		zirfWall(1, 40, zirfThickness(0.5))
		zirfWall(2, 40, zirfThickness(0.5))
		zirfWall(6, 40, zirfThickness(0.5))
		zirfWall(7, 40, zirfThickness(0.5))
		zirfWall(8, zirfThickness(2) + 40, zirfThickness(0.5))
		
		zirfWall(2, 40, zirfThickness(1))
		zirfWall(3, zirfThickness(1) + 40, zirfThickness(1))
		zirfWall(4, zirfThickness(1) + 40, zirfThickness(1))
		zirfWall(5, zirfThickness(1) + 40, zirfThickness(1))
		zirfWall(6, 40, zirfThickness(1))
		
		zirfWall(1, 40, zirfThickness(1.5))
		zirfWall(7, 40, zirfThickness(1.5))
		
		zirfWall(2, 40, zirfThickness(2))
		zirfWall(6, 40, zirfThickness(2))
		
		zirfWall(1, 40, zirfThickness(2.5))
		zirfWall(2, 40, zirfThickness(2.5))
		zirfWall(3, 40, zirfThickness(2.5))
		zirfWall(5, 40, zirfThickness(2.5))
		zirfWall(6, 40, zirfThickness(2.5))
		zirfWall(7, 40, zirfThickness(2.5))
		
		chunkSide = chunkSide + 9
	
	elseif mKey == 5 then
	horoSideStuff = rDir()
	
	for a = 0, 3 do
		for i = 1, 4 do
			zirfWall((i + horoSideStuff) % 6, 40, zirfThickness(a))
			if a < 3 then
				zirfWall(2 % 6, 40, zirfThickness(a + 0.5))
				zirfWall(3 % 6, 40, zirfThickness(a + 0.5))
			end
		end
	horoSideStuff = horoSideStuff * -1
	end
		
		chunkSide = chunkSide + 6
	
	end
end

function DashKey()
keys = { 1, 1, 1, 1, 2, 2, 3, 3, 4, 5, 5 }
shuffle(keys)
index = 0
end

-- zirfWall(0, 40, i * zirfThickness(0.5) + 930, 14, -1.26, -14, 14) -- prefire wall
-- zirfWall(0, 400, i * zirfThickness(0.5),      -10, 0.53, -10, 10) -- firewall

function ShootoutPatterns(mKey)
	if mKey == 1 then
	horoSideStuff = math.random(0, 1)
	
	for a = 0, 5 do
		zirfWall((a + horoSideStuff) % 4, 40, a * zirfThickness(0.5))
		zirfWall((a + 2 + horoSideStuff) % 4, 40, a * zirfThickness(0.5))
	end
		
		chunkSide = chunkSide + 4
	
	elseif mKey == 2 then
	horoSideStuff = math.random(0, 1)
	
	zirfWall(0, zirfThickness(3), 0)
	zirfWall(4, zirfThickness(3), 0)
	for a = 0, 5 do
		for i = 0, 1 do
			zirfWall((horoSideStuff + i) % 3 + 1, 40, a * zirfThickness(0.5))
		end
		horoSideStuff = horoSideStuff * -1 + 1
	end
		
		chunkSide = chunkSide + 5
	
	end
end

function ShootoutKey()
keys = { 1, 1, 2 }
shuffle(keys)
index = 0
end

-- zirfWall(2, 30, 0, 1, 0, 1, 1, 0) -- regular
-- zirfWall(0, 30, 0, 2, -0.1, 0.5, 2, 0) -- slow
-- zirfWall(0, 30, zirfThickness(0.5), 3, -0.225, -3.5, 3, 0) -- fakeout
-- zirfWall(0, 30, 0, 2, -0.1, -2.5, 2, 0) -- fakeout slow
-- zirfWall(0, 30, 0, 3, -0.225, -0.45, 3, 1) -- trickster
-- zirfWall(1, 30, 0, 2, -0.1, -0.033, 2, 1) -- trickster slow
-- zirfWall(1, 30, zirfThickness(0.5), 7, -1.435, 0.33, 7, 0) -- dash
--

function NowherePatterns(mKey)
	
	
	if (chunkSide + l_getLevelTime()) % 14 > 7 then
		zirfWall(math.random(2, 3), zirfThickness(0.5) + 30, zirfThickness(0.5), 1, 0, 1, 1, 0) -- regular
	end
	if (chunkSide + l_getLevelTime()) % 18 > 11 then
		zirfWall(0, zirfThickness(0.5) + 30, 0, 1, 0, 1, 1, 0) -- regular
	else
		zirfWall(0, zirfThickness(0.25) + 30, 0, 1, 0, 1, 1, 0) -- regular
		zirfWall(0, zirfThickness(0.25) + 30, zirfThickness(0.5), 1, 0, 1, 1, 0) -- regular
	end
		
	if mKey == 1 then
		horoSideStuff = math.random(0, 1)
	
		
		zirfWall(2, 30, zirfThickness(0.75), 3, -0.22, 0.5, 3, 0) -- slow
		zirfWall(3, 30, zirfThickness(0.75), 3, -0.22, 0.5, 3, 0) -- slow
		
		zirfWall(1 + horoSideStuff, 30, zirfThickness(0.5), 3, -0.22, -3.5, 3, 0) -- fakeout
		zirfWall(4 - horoSideStuff, 30, zirfThickness(0.5), 3, -0.22, -3.5, 3, 0) -- fakeout
		
		zirfWall(2 - horoSideStuff, 30, zirfThickness(0.5), 3, -0.22, -0.4, 3, 1) -- trickster
		zirfWall(3 + horoSideStuff, 30, zirfThickness(0.5), 3, -0.22, -0.4, 3, 1) -- trickster
		
		
		chunkSide = chunkSide + 5
		
	elseif mKey == 2 then
		horoSideStuff = math.random(0, 1)
	
		
		zirfWall(1 + horoSideStuff * 5, 30, zirfThickness(0.75), 3, -0.22, 0.5, 3, 0) -- slow
		zirfWall(2 + horoSideStuff * 3, 30, zirfThickness(0.75), 3, -0.22, 0.5, 3, 0) -- slow
		zirfWall(4 - horoSideStuff, zirfThickness(0.125) + 30, zirfThickness(0.75), 3, -0.22, 0.5, 3, 0) -- slow
		
		zirfWall(1, 30, zirfThickness(0.5), 3, -0.22, -3.5, 3, 0) -- fakeout
		zirfWall(2, 30, zirfThickness(0.5), 3, -0.22, -3.5, 3, 0) -- fakeout
		zirfWall(5, 30, zirfThickness(0.5), 3, -0.22, -3.5, 3, 0) -- fakeout
		zirfWall(6, 30, zirfThickness(0.5), 3, -0.22, -3.5, 3, 0) -- fakeout
		
		zirfWall(3, 30, zirfThickness(0.5), 3, -0.22, -0.4, 3, 1) -- trickster
		zirfWall(4, 30, zirfThickness(0.5), 3, -0.22, -0.4, 3, 1) -- trickster
		
		
		chunkSide = chunkSide + 7
		
	end
end

function NowhereKey()
keys = { 1, 2 }
shuffle(keys)
index = 0
end
