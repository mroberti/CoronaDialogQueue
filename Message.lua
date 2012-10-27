-------------------------------------------------
--
-- Message.lua
--
-- Example "Message" class for Corona SDK tutorial.
-- Example usage:
-- local Message = require( "Message")
-- local myMessage = Message.new()
--

local Message = {}
local Message_mt = { __index = Message }	-- metatable

-------------------------------------------------
-- PUBLIC FUNCTIONS
-------------------------------------------------

function Message.new(passedGroup,passedString )
     local newMessage = {
          myText = nil,
     }
     newMessage.myText = display.newText( passedString,math.random(0,screenW),math.random(0,screenH), 300, 100, nil, 6 )
     print("Adding text!")
     return setmetatable( newMessage, Message_mt )
end

function Message:Destroy()
     local child = self.myText
     display.remove( child )
     child = nil
end

function Message:Update()
     
end
-------------------------------------------------

return Message



