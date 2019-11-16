
local system, eventManager, entity = System(), EventManager(), Entity()
system:Init("System")
eventManager:Init("EventManager")
local printer = Component("Printer", {
    Update = function ()
        print("Printer: 1")
    end
})
entity:Init("Entity", eventManager, function (self)
    self:AddComponent(printer)
    local printer = self:GetComponent("Printer")
end)
local event = Event()
event:Init("OnEnd", {
    Check = function ()
        return true
    end,
    Fire = function (entity)
        print("GameState: End")
    end
})
eventManager:AddEvent(event)
system:AddEntity(entity)

--Update
system:Update()
