-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Tim Riscalas
-- Course: ICS2O/3C
-- This program moves a beetleship across the 
-- screen and then makes it fade in. I added 
-- a second object that moves in a different 
-- direction, fades in and shrinks in size.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

local backgroundSound = audio.loadSound("Sounds/background sound.mp3") -- setting a variable to the mp3 file
local backgroundSoundChannel = audio.play(backgroundSound,{loops = -1})


-- global variables
scrollSpeedBeetleship = 3.5
scrollSpeedOctopus = 4.0


-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this funstion accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeedBeetleship
	-- change the transparency of the ship every time it moves so that it fades in
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- charcter image with width and height
local octopus = display.newImageRect("Images/octopus.png", 300, 300)

-- set the image to be in full colour
octopus.alpha = 1

-- set the intial x and y position of octopus
octopus.x = 1024
octopus.y = display.contentHeight * 2/3

-- Function: MoveShip
-- Input: this funstion accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the octopus
local function MoveOctopus(event)
	-- add the scroll speed to the x-value of the ship
	octopus.x = octopus.x - scrollSpeedOctopus
	-- change the transparency of the ship every time it moves so that it fades out
	octopus.alpha = octopus.alpha - 0.0001  
	-- make the octopus grow in size
	octopus:scale(1.003, 1.003)
end

-- MoveOctopus will be called over and over again
Runtime:addEventListener("enterFrame", MoveOctopus)