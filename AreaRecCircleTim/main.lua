-----------------------------------------------------------------------------------------
-- Title: AreaOfRectangleAndCircle
-- Name: Tim Riscalas
-- Course: ICS20/3C
-- This program will display a rectangle and its area plus it will display a circle and calculate its area.
-----------------------------------------------------------------------------------------

-- Your code here

-- create my local variables
local areaTextRectangle
local textSize = 20
local myRectangle
local widthOfRectangle = 300
local heightOfRectangle = 100
local areaOfRectangle 
local PI = 3.14
local areaOfCircle
local radiusOfCircle = 20
local myCircle
local areaTextCircle

-- set the background colour of my screen.
display.setDefault("background", 28/255, 162/255, 176/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 15

-- set the color of the rectangle
myRectangle:setFillColor(24/255 , 100/255 , 213/255)

-- set the color of the border
myRectangle:setStrokeColor(0.5, 0.3, 0.7)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaTextRectangle = display.newText("The area of this rectangle with a width of \n" ..
widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
areaOfRectangle .. " pixels².", 0, 0 , Lobster, textSize)

-- anchor the text and set its (x,y) position
areaTextRectangle.anchorX = 0
areaTextRectangle.anchorY = 0
areaTextRectangle.x = 20
areaTextRectangle.y = display.contentHeight/2

-- set the colour of the new text
areaTextRectangle:setTextColor(1, 1, 1)

-- display the circle
myCircle = display.newCircle( 400, 75, 50)

--set the width of the border
myCircle.strokeWidth = 10

-- set the color of the circle
myCircle:setFillColor( 195/255, 9/255, 9/255)

-- set the color of the border
myCircle:setStrokeColor( 255/255, 102/255, 0/255)

-- calculate the area
areaOfCircle = PI * radiusOfCircle * radiusOfCircle

-- write the area on the screen
areaTextCircle = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " is " .. areaOfCircle .. " pixels².", 0, 0, Lobster, textSize)
-- anchor the text and set its (x,y) position
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 12
areaTextCircle.x = 40
areaTextCircle.y = display.contentHeight/1.2

-- set the colour of the new text
areaTextCircle:setTextColor( 1, 1, 1)