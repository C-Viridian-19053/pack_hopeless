-- custom walls are quite confusing, so this is here to help!

function fractal(mSides, mSideClose, mSideStart, mSideplus, mSidewidth, mThickness, mDistance, mDistanceplus, mTimes, R, G, B, A, mColoring, Rb, Gb, Bb, Ab, Rc, Gc, Bc, Ac, Rd, Gd, Bd, Ad)
	mSideClose = mSideClose or mSides
	local side = math.pi / mSides
	local distance = 0
	side = side + mSideStart * (math.pi / (mSides / 2))

	for a = 1, mTimes do
		for i = 1, mSideClose do
			local quor = cw_createNoCollision()
			cw_setVertexPos(quor, 0, math.sin(side - (math.pi * mSidewidth) / mSides) * (mDistance + distance), math.cos(side - (math.pi * mSidewidth) / mSides) * (mDistance + distance))
			cw_setVertexPos(quor, 1, math.sin(side + (math.pi * mSidewidth) / mSides) * (mDistance + distance), math.cos(side + (math.pi * mSidewidth) / mSides) * (mDistance + distance))
			cw_setVertexPos(quor, 2, math.sin(side + (math.pi * mSidewidth) / mSides) * (mDistance + mThickness + distance), math.cos(side + (math.pi * mSidewidth) / mSides) * (mDistance + mThickness + distance))
			cw_setVertexPos(quor, 3, math.sin(side - (math.pi * mSidewidth) / mSides) * (mDistance + mThickness + distance), math.cos(side - (math.pi * mSidewidth) / mSides) * (mDistance + mThickness + distance))
			if mColoring == 1 then
				cw_setVertexColor(quor, 0, R or 0, G or 0, B or 0, A or 0)
				cw_setVertexColor(quor, 1, Rb or 0, Gb or 0, Bb or 0, Ab or 0)
				cw_setVertexColor(quor, 2, Rc or 0, Gc or 0, Bc or 0, Ac or 0)
				cw_setVertexColor(quor, 3, Rd or 0, Gd or 0, Bd or 0, Ad or 0)
			else
				for Vclr = 0, 3 do cw_setVertexColor(quor, Vclr, R or 0, G or 0, B or 0, A or 0); end
			end

			side = side + math.pi / (mSides / 2)
		end

		side = side + mSideplus * (math.pi / (mSides / 2))
		distance = distance + mDistanceplus
	end
end
