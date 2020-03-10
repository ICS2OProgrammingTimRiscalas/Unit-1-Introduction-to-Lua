-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name:  Tim 
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault("background", 115/255, 56/255, 253/255)

-------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------------------------
local questionObject
local correctObject
local incorrectObject
local numericTextFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer

-------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	correctAnswer = randomNumber1 + randomNumber2


	-- create question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event)

	-- user begins editing "numericField"
	if (event.phase == "begin") then

		-- clear txt field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the user's answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			timer.performWithDelay(1500, HideCorrect)

		else
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(2500, HideIncorrect)



		end
		event.target.text = ""
	end
end

------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText("", display.contentWidth/3, display.contentHeight * 2/3, nil, 60)
questionObject:setTextColor(60/255, 185/255, 51/255)
--questionObject.isVisible = true

-- create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/1.4, display.contentHeight * 2/3, nil, 50)
correctObject:setTextColor(66/255, 226/255, 26/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText("Sorry,that's incorrect! Try again!", display.contentWidth/2, display.contentHeight/3, nil, 50)
incorrectObject:setTextColor(226/255, 26/255, 26/255)
incorrectObject.isVisible = false

-- create numeric field
numericTextFields = native.newTextField( display.contentWidth/2, display.contentHeight * 2/3, 200, 100)
numericTextFields.inputType = "number"

-- add the event listener for the numeric field
numericTextFields:addEventListener("userInput", NumericFieldListener)

AskQuestion()