-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Tim Riscalas
-- Course: ICS2O/3C
-- This program 
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-- bkg music
local bkgSound = audio.loadSound("Sounds/bkg music.mp3") -- setting a variable to an mp3 file
local bkgSoundChannel = audio.play(bkgSound)
	
------------------------------------------------------------------------------------------
-- OBJECTS
------------------------------------------------------------------------------------------
-- ground
local ground = display.newImage("Images/ground.png", 0, 0)
	-- set the x and y position
	ground.x = display.contentWidth / 2
	ground.y = display.contentHeight
	-- change the width to be the same as the screen
	ground.width = display.contentWidth
	-- add to physics
	physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

-- beam1
local beam1 = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y position
	beam1.x = display.contentCenterX / 5
	beam1.y = display.contentCenterY * 1.65
	-- change the width and height of the beam1
	beam1.width = display.contentWidth / 2
	beam1.height = display.contentHeight * 1/10
	-- rotate the beam1 -60 degrees so its on an angle
	beam1:rotate(45)
	-- send it to the back layer
	beam1:toBack()
	-- add to physics
	physics.addBody(beam1, "static", {friction = 0.5, bounce = 0.3})

-- beam2
local beam2 = display.newImage("Images/beam.png", 0, 0)
	-- set the x and y position
	beam2.x = display.contentCenterX / 0.55
	beam2.y = display.contentCenterY * 1.65
	-- change the width and height of the beam1
	beam2.width = display.contentWidth / 2
	beam2.height = display.contentHeight * 1/10
	-- rotate the beam1 -60 degrees so its on an angle
	beam2:rotate(-45)
	-- send it to the back layer
	beam2:toBack()
	-- add to physics
	physics.addBody(beam2, "static", {friction = 0.5, bounce = 0.3})

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)
	-- set the x and y pos
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY
	-- change the width and height of the bkg image
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight
	-- send to back
	bkg:toBack()

---------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------
-- create the first ball
local function FirstBall()
	-- creating the first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)
	-- add to physics
	physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25}) 
end

-- create the second ball 
local function SecondBall()
	-- creating the second ball
	local ball2 = display.newImage("Images/super_ball.png", 1024, 0)
	-- add to physics
	physics.addBody(ball2, {density = 1.0, friction = 0.5, bounce = 0.7, radius = 12.5})
	-- change the size of the ball 
	ball2:scale(0.5, 0.5)
end

-- create the third ball 
local function ThirdBall()
	-- creating the third ball 
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)
	-- add to physics 
	physics.addBody(ball3, {density = 2.0, friction = 0.2, bounce = 0.5, radius = 50})
	-- change the size of the ball 
	ball3:scale(2, 2)
end

-- create the fourth ball 
local function FourthBall()
	-- creating the fourth ball 
	local ball4 = display.newImage("Images/super_ball.png", 1024, 0)
	-- add to physics 
	physics.addBody(ball4, {density = 5.0, friction = 0.1, bounce = 0.735, radius = 100})
	-- change the size of the ball 
	ball4:scale(4, 4)
end

-- create the fifth ball 
local function FifthBall()
	-- creating the fifth ball 
	local ball5 = display.newImage("Images/super_ball.png", 1024, 0)
	-- add to physics 
	physics.addBody(ball5, {density = 5.0, friction = 0.8, bounce = 0.6, radius = 62.5})
	-- change the size of the ball 
	ball5:scale(2.5, 2.5)
end

-- create the sixth ball 
local function SixthBall()
	local ball6 = display.newImage("Images/super_ball.png", 0, 0)
	physics.addBody(ball6, {density = 1.0, friction = 0.5, bounce = 0.5, radius = 37.5})
	-- change the size of the ball 
	ball6:scale(1.5, 1.5)
end
------------------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
------------------------------------------------------------------------------------------------
timer.performWithDelay( 0, FirstBall)
timer.performWithDelay( 1500, SecondBall)
timer.performWithDelay( 500, ThirdBall)
timer.performWithDelay( 0, FourthBall)
timer.performWithDelay( 500, FifthBall)
timer.performWithDelay( 1000, SixthBall)