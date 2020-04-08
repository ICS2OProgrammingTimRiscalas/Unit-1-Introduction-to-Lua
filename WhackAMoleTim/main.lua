-----------------------------------------------------------------------------------------
-- Title: WhackAbabyYoda
-- Name: Tim R
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create bkg
display.setDefault("background", 26/255, 196/255, 185/255)

-- bkg sound
local bkgSound = audio.loadSound("Sounds/bkg music.mp3")
local bkgSoundChannel = audio.play(bkgSound)

-- touch sound
local touchSound = audio.loadSound("Sounds/touch sound.mp3")
local touchSoundChannel

-- you win sound 
local youWinSound = audio.loadSound("Sounds/you win sound.mp3")
local youWinSoundChannel

-- creating babyYoda
local babyYoda = display.newImageRect("Images/babyYoda.png", 250, 250)
	-- scale the babyYoda to be a third of its original size
	babyYoda:scale(2/3, 2/3)
	-- make the babyYoda invisible
	babyYoda.isVisible = false

local score = 0
	-- display the amount of score as a text object
	scoreText = display.newText("Score: " .. score, display.contentWidth/1.2, display.contentHeight/10, nil, 75)
	-- set the colour of the text object
	scoreText:setTextColor(137/255, 43/255, 178/255)

local youWinImage = display.newImageRect("Images/youWinImage.png", display.contentWidth, display.contentHeight)
youWinImage.anchorX = 0
youWinImage.anchorY = 0
youWinImage.isVisible = false

--------------------------------------------------------------------------------------------------------------------
-- FUNCTONS
--------------------------------------------------------------------------------------------------------------------

-- this function that makes the babyYoda appear ina random (x,y) positionon the screen 
-- before calling the hide function
function PopUp()
	-- choosing random position on screen between 0 and the size of the screen
	babyYoda.x = math.random(0, display.contentWidth)
	babyYoda.y = math.random(0, display.contentHeight)
	-- make the babyYoda visible
	babyYoda.isVisible = true
	-- call the hide function after 500 milliseconds
	timer.performWithDelay(850, Hide)
end

-- this function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay( 2000, PopUp)
end

-- this function makes the babyYoda invisible and then calls the PopUpDelay function
function Hide()
	-- changing visibility
	babyYoda.isVisible = false
	PopUpDelay()
end

-- this function starts the game 
local function GameStart()
	PopUpDelay()
end

-- this function increments the score only if the babyYoda is clicked. 
-- It then displays the new score.
local function Whacked( event)
	-- if touch phase just started
	if (event.phase == "began") then
		score = score + 1
		touchSoundChannel = audio.play(touchSound)
		-- update it in the display object
		scoreText.text = "Score: " .. score 
	end

	if (score == 10) then
		youWinImage.isVisible = true
		audio.stop(bkgSoundChannel)
		audio.stop(touchSoundChannel)
		youWinSoundChannel = audio.play(youWinSound)
	end
end

----------------------------------------------------------------------------------------------------------
-- EVENT LISTENERS
----------------------------------------------------------------------------------------------------------

-- I added this event listener so that if the babyYoda is touched, the Whacked function is called
babyYoda:addEventListener("touch", Whacked)

-- I added this event listemer to start the game
GameStart()