-----------------------------------------------------------------------------------------
-- Title: Hello, World!
-- Name: Tim R
-- ICS20/3C
-- This program displays "Hello Nic!" and "By Tim Riscalas" on the iPad simulator and "What's Upppp!" to the command terminal.
-----------------------------------------------------------------------------------------



-- print "What's Upppp" to the command terminal
print("**** What's Upppp!")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the colour of the background
display.setDefault ("background", 9/255, 53/255, 155/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 300 with
-- a default font style and font size of 80
textObject = display.newText( "Hello, Nic!", 500, 300, nil, 80 )

-- sets the color of the text
textObject:setTextColor(238/255, 61/255, 61/255)

-- print "This is awesome!" to the command terminal
print("**** This is awesome!")

--create a local variable
local textObjectSignature

-- displays text on screen at position x = 500 and y = 500 with
-- a default font style and font size of 50
textObjectSignature = display.newText( "By Tim Riscalas", 500, 500, nil, 50)
-- sets the colour of the text
textObjectSignature:setTextColor(0/255, 0/25, 0/255)