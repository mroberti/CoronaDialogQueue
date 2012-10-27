-------------------------------------------------
--
-- MessageQueue.lua
--
-- Example "MessageQueue" class for Corona SDK tutorial.
-- Example usage:
-- local MessageQueue = require( "MessageQueue")
-- local myMessageQueue = MessageQueue.new()
--
-------------------------------------------------
local Message = require ("Message")
local MessageQueue = {}
local MessageQueue_mt = { __index = MessageQueue }	-- metatable

-------------------------------------------------
-- PUBLIC FUNCTIONS
-------------------------------------------------

function MessageQueue.new( )
	local newMessageQueue = {
		messages = {},
          name = "asdasdas"
	}
     
	return setmetatable( newMessageQueue, MessageQueue_mt )
end

function MessageQueue:Destroy(passedMessage)

end

function Fade(passedMessage)
     transition.to(passedMessage.myText, {time = 10000, alpha = 0})
end

function MessageQueue:Add(passedMessage)
     local tempMessage = Message.new(nil,passedMessage)
     table.insert(self.messages,tempMessage)
     --     table.insert(shipTable,tempShip2)	
     timer.performWithDelay( 1000, Fade(tempMessage) ,1)
end

function MessageQueue:Update()
      print("We're holding: "..#self.messages.." messages")
    for i=1,#self.messages do
         print("Contents of message "..i.." are "..self.messages[i].myText.text)
    end
end
-------------------------------------------------

return MessageQueue

