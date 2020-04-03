-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name:  Tim 
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield. It also has a score system.
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
local points = 0
local youWin
local incorrectPoints = 0
local gameOver

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

local function HideYouWin()
	youWin.isVisible = false
end

local function HideGameOver()
	gameOver.isVisible = false
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	if (incorrectObject.isVisible == false) and (incorrectPoints == 3) then
		gameOver.isVisible = true
		-- clear points to 0 after losing
		incorrectPoints = 0
		points = 0
		incorrectPointsText.text = "Times Wrong = " .. incorrectPoints 
		pointsText.text = "Points = " .. points
		timer.performWithDelay(3000)
		timer.performWithDelay(3000, HideGameOver)
		timer.performWithDelay(3500, AskQuestion)
	end
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
			youWin.isVisible = false
			timer.performWithDelay(1500, HideCorrect)

			-- give a point if user gets the correct answer
			points = points + 1

			-- update it in the display object
			pointsText.text = "Points = " .. points

			if (points >= 5) then
				youWin.isVisible = true
				correctObject.isVisible = false

				-- clear points to 0 after winning
				points = 0
				incorrectPoints = 0
				pointsText.text = "Points = " .. points
				incorrectPointsText.text = "Times Wrong = " .. incorrectPoints 
				timer.performWithDelay(3000, HideYouWin)
			end

		-- inside the else means they got it wrong
		else
			incorrectObject.text = "Sorry, that's incorrect! The correct answer is \n" .. 
	 		correctAnswer .. ". Try again!"
			incorrectObject.isVisible = true


			-- give a point to incorrectPoints if user gets the wrong answer
			incorrectPoints = incorrectPoints + 1

			-- update it in the display object
			incorrectPointsText.text = "Times Wrong = " .. incorrectPoints
			timer.performWithDelay(3000, HideIncorrect)

			-- if the user gets the wrong answer 3 times:
			if (incorrectPoints == 3) then
				incorrectObject.isVisible = true
				timer.performWithDelay(2000, HideIncorrect)
			end
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
questionObject.isVisible = true

AskQuestion()

-- create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/1.4, display.contentHeight * 2/3, nil, 50)
correctObject:setTextColor(66/255, 226/255, 26/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText("", display.contentWidth/2, display.contentHeight/3, nil, 50)
incorrectObject:setTextColor(226/255, 26/255, 26/255)
incorrectObject.isVisible = false

-- create numeric field
numericTextFields = native.newTextField( display.contentWidth/2, display.contentHeight * 2/3, 200, 100)
numericTextFields.inputType = "number"

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/1.2, display.contentHeight/7, nil, 50)

-- display the amount of incorrect points as a text object
incorrectPointsText = display.newText("Times Wrong = " .. incorrectPoints, display.contentWidth/1.32, display.contentHeight/4.5, nil, 50)

-- add the event listener for the numeric field
numericTextFields:addEventListener("userInput", NumericFieldListener)

-- create the youWin text object and make it visible
youWin = display.newText("YOU WIN!", display.contentWidth/2, display.contentHeight/3, nil, 75)
youWin:setTextColor(240/255, 92/255, 28/255)
youWin.isVisible = false

-- create the gameOver text object and make it visible
gameOver = display.newText("GAME OVER", display.contentWidth/2, display.contentHeight/2, nil, 75)
gameOver:setTextColor(198/255, 13/255, 19/255)
gameOver.isVisible = false