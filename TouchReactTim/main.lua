-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Tim
-- Course: ICS2O/3C
-- This program does something when I click on the button.
-----------------------------------------------------------------------------------------

-- set the background color
display.setDefault("background", 24/255, 152/255, 178/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create the sound
local correctSound = audio.loadSound("Sound/Correct Answer Sound Effect.mp3")
local correctSoundChannel

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isvisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create checkmark, set its position and make it visible
local checkMark = display.newImageRect("Images/checkmark.png", 198, 96)
checkMark.x = display.contentWidth/1.3
checkMark.y = display.contentHeight/2
checkMark.isVisible = false

-- create text object, set its position and make it visible
local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor(1,1,0)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkMark.isVisible = true
		correctSoundChannel = audio.play(correctSound)

	end
	
	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkMark.isVisible = false
		
	end
end

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button ND checkmark 
-- and make the blue button disappear
local function RedButtonListener(event)
	if (event.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkMark.isVisible = false
	end

	if (event.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkMark.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)
