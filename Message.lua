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
          dead = false
     }
     newMessage.myText = display.newText( passedString,0,0, 300, 35, nil, 6 )
     print("Adding text!")
     return setmetatable( newMessage, Message_mt )
end

function Message:Initialize()
     local function SetDead()
          self.dead = true
     end
     local function DelayThenFade()
          print("DelayThenFade")
          transition.to(self.myText, {time = 3000, alpha = 0, onComplete = SetDead})
     end
     local function WaitForAMoment()
          print("WaitForAMoment")
          transition.to(self.myText, {time = 2000, alpha = 1, onComplete = DelayThenFade})
     end
     WaitForAMoment()
     
end

function Message:Update()
     
end
-------------------------------------------------

return Message



