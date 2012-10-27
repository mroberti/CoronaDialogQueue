
-- Example usage:
local MessageQueue = require( "MessageQueue")
local myMessageQueue = MessageQueue.new()
-- Set the screen width and centers for ease of use
-- down the road...
screenW = display.contentWidth
screenH = display.contentHeight
centerX  = display.contentWidth/2
centerY = display.contentHeight/2

function LoadRemoteText( event )
     myMessageQueue:Add(event.response)
end

function CreateMessage()
     network.request( "http://iheartquotes.com/api/v1/random?format=text&max_lines=4&max_characters=160", "GET", LoadRemoteText )
end
timer.performWithDelay(1000, CreateMessage ,-1)

