-- EventManager

EventManager = Class()

function EventManager:Init(name)
    self.Event = {}
    self.Name = name
    self.Entity = nil
end

function EventManager:FireEvent(name)
    local event = self.Event[name]
    if event then
        event:Fire(self.Entity)
    end
end

function EventManager:CheckEvent(name)
    local event = self.Event[name]
    if event then
        if event:Check(self.Entity) then
            self:FireEvent(name)
        end
    end
end

function EventManager:AddEvent(event)
    self.Event[event.Name] = event
end

function EventManager:RemoveEvent(name)
    self.Event[name] = nil
end

function EventManager:Update(entity)
    for k, v in pairs(self.Event) do
        self:CheckEvent(k)
    end
    self.Entity = entity
end
