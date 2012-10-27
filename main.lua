-- Example usage:
local MessageQueue = require( "MessageQueue")
local myMessageQueue = MessageQueue.new()
-- -- Performance meter
 local performance = require('performance')
 performance:newPerformanceMeter()
-- Set the screen width and centers for ease of use
-- down the road...
screenW = display.contentWidth
screenH = display.contentHeight
centerX  = display.contentWidth/2
centerY = display.contentHeight/2

-- Called from the 'CreateMessage method on successful completion of 
-- downloading a new random quote.
function LoadRemoteText( event )
     -- Have the MessageQueue object create a new message
     -- using the text in the 'event.response' field.
     myMessageQueue:Add(event.response)
end


function CreateMessage()
     network.request( "http://iheartquotes.com/api/v1/random?format=text&max_lines=4&max_characters=160", "GET", LoadRemoteText )
end

-- Every 1.5 seconds (1500ms) call the CreateMessage function. The -1 denotes to repeat indefinitely...
timer.performWithDelay(1500, CreateMessage ,-1)

----------------------------------------------------------------
-- MAIN LOOP
----------------------------------------------------------------
local function Main( event )
     myMessageQueue:Update()	-- Do stuff
end

Runtime:addEventListener( "enterFrame", Main )


