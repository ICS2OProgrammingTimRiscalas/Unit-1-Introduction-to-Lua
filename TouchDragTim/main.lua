-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Tim Riscalas
-- Course: ICS2O/3C
-- This program displays images that react to a person's finger.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local pinkGirl = display.newImageRect("Images/pinkGirl.png", 150, 150)
local pinkGirlWidth = pinkGirl.width
local pinkGirlHeight = pinkGirl.height

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

local planet = display.newImageRect("Images/planet.png", 150, 150)
local planetWidth = planet.width
local planetHeight = planet.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedStar = false
local alreadyTouchedPlanet = false

-- set the initial x and y position of my image
pinkGirl.x = 400
pinkGirl.y= 500

star.x = 300
star.y = 200

planet.x = 500
planet.y = 100

-- Function: StarListener
-- Input: touch listener
-- Output: none
-- Description: when star is touched, move it
local function StarListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPinkGirl == false) and (alreadyTouchedPlanet == false) then
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then
	star.x = touch.x
	star.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedPinkGirl = false
		alreadyTouchedStar = false
		alreadyTouchedPlanet = false
	end
end


-- Function: pinkGirlListener
-- Input: touch listener
-- Output: none
-- Description: when pinkGirl is touched, move it
local function PinkGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedStar == false) and (alreadyTouchedPlanet == false) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPinkGirl == true) ) then
	pinkGirl.x = touch.x
	pinkGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedStar = false
		alreadyTouchedPlanet = false
		alreadyTouchedPinkGirl = false
	end
end


-- Function: planet
-- Input: touch listener
-- Output: none
-- Description: when planet is touched, move it
local function PlanetListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedStar == false) and (alreadyTouchedPinkGirl == false) then
			alreadyTouchedPlanet = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPlanet == true) ) then
	planet.x = touch.x
	planet.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedStar = false
		alreadyTouchedPinkGirl = false
		alreadyTouchedPlanet = false
	end
end


-- add the respective listeners to each object
star:addEventListener("touch", StarListener)
pinkGirl:addEventListener("touch", PinkGirlListener)
planet:addEventListener("touch", PlanetListener)