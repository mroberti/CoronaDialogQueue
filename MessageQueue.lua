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
local MessageSpacing = 35
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

function MessageQueue:Add(passedMessage)
     local tempMessage = Message.new(nil,passedMessage)
     table.insert(self.messages,tempMessage)
     --     table.insert(shipTable,tempShip2)	
     tempMessage:Initialize()
     for i=1,#self.messages do
          local child = self.messages[i].myText
          child.y =  (i*MessageSpacing)
     end
     
end

function MessageQueue:Update()
     function ArrangeMessageList()
          for i=#self.messages,1 do
               local child = self.messages[i].myText
               child.y =  (i*MessageSpacing)
          end
     end
     function RemoveMessage(passedIndex)
          print("Messages before removal "..#self.messages)
          local child = self.messages[passedIndex]
          display.remove( child.myText )
          child.myText = nil
          table.remove(self.messages,passedIndex)
          print("Scroller contents after removal "..#self.messages)
          ArrangeMessageList()
     end---------------------------------------
     -- @return
     
     if(#self.messages>0)then
          for i=1,#self.messages do
               if(self.messages[i].dead)then
                    print("Item "..i.." is dead")
                    RemoveMessage(i)
                    break
               else
                    print("Item "..i.." is alive")
               end
          end
     end
end

return MessageQueue

