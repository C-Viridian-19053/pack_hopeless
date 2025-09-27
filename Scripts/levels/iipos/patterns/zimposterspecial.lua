u_execScript("common.lua")
u_execScript("utils.lua")

function fractal(mTimes, mSides, mSidewidth, mSideInc, mThickness, mDistanceStart, mDistanceInc, mRed, mGreen, mBlue, mAlpha)
	for a = 0, mTimes - 1 do
		for i = 1, mSides do
			wImpWallFrac(i + (a * mSideInc), mSidewidth, 0, 0, mDistanceStart + (a * mDistanceInc), 0, 0, 0, 0, 0, mThickness, mSides, mRed, mGreen, mBlue, mAlpha, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		end
	end

end

function fractalDistCurve(mTimes, mSides, mSidewidth, mSideInc, mThickness, mDistanceStart, mDistCurve, mDistStartCurve, mDistStartIncCurve, mDistanceSpeedCurve, mDistanceInc, mRed, mGreen, mBlue, mAlpha)
	for a = 0, mTimes - 1 do
		for i = 1, mSides do
			wImpWallFrac(i + (a * mSideInc), mSidewidth, 0, 0, mDistanceStart + (a * mDistanceInc), mDistCurve, mDistStartCurve, mDistStartCurve + (a * mDistStartIncCurve), mDistanceSpeedCurve, 0, mThickness, mSides, mRed, mGreen, mBlue, mAlpha, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		end
	end

end

function fractalCurve(mTimes, mSides, mSidewidth, mSideInc, mThickness, mDistanceStart, mDistanceInc, mRed, mGreen, mBlue, mAlpha, mCurve, mCurveStart, mCurveStartInc, mCurveSpeed)
	for a = 0, mTimes - 1 do
		for i = 1, mSides do
			wImpWallFrac(i + (a * mSideInc), mSidewidth, 0, 0, mDistanceStart + (a * mDistanceInc), 0, 0, 0, 0, 0, mThickness, mSides, mRed, mGreen, mBlue, mAlpha, mCurve, mCurveStart, mCurveStart + (a * mCurveStartInc), mCurveSpeed, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		end
	end

end

function fractalWidths(mTimes, mSides, mSidewidthBase, mSidewidthThickness, mSideInc, mThickness, mDistanceStart, mDistanceInc, mRed, mGreen, mBlue, mAlpha)
	for a = 0, mTimes - 1 do
		for i = 1, mSides do
			wImpWallFrac(i + (a * mSideInc), 0, mSidewidthBase, mSidewidthThickness, mDistanceStart + (a * mDistanceInc), 0, 0, 0, 0, 0, mThickness, mSides, mRed, mGreen, mBlue, mAlpha, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		end
	end

end


-- this is a very special fractal. it combines all the values in the fractals above, so you can get really crazy with it!
-- the drawback however is the sheer amount of values to keep track of, so it might get super annoying to use if you cant keep track, however
-- i feel the crazy shit you can make with this is worth it

-- over time this function will gain more values.

function fractalCombination(mTimes, mSides, mSidewidthBase, mSidewidthThickness, mSideInc, mThickness, mDistanceStart, mDistanceInc, mRed, mGreen, mBlue, mAlpha, mCurve, mCurveStart, mCurveStartInc, mCurveSpeed)
	for a = 0, mTimes - 1 do
		for i = 1, mSides do
			wImpWallFrac(i + (a * mSideInc), 0, mSidewidthBase, mSidewidthThickness, mDistanceStart + (a * mDistanceInc), 0, 0, 0, 0, 0, mThickness, mSides, mRed, mGreen, mBlue, mAlpha, mCurve, mCurveStart, mCurveStart + (a * mCurveStartInc), mCurveSpeed, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		end
	end

end



