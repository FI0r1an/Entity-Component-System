-- Entity

Entity = Class()

function Entity:Init(name, em, ctor)
    self.Component = {}
    self.EventManager = em
    self.EventManager.Entity = self
    self.Name = name
    local f = ctor or function () end
    f(self)
end

function Entity:AddComponent(...)
    for k, component in pairs({...}) do
        self.Component[component.__id] = Class(component)
    end
    return self:GetComponent(...)
end

function Entity:GetComponent(...)
    local t = {}
    for k, v in pairs({...}) do
        table.insert(t, self.Component[v])
    end
    return unpack(t)
end

function Entity:RemoveComponent(name)
    self.Component[name] = nil
end

function Entity:OnUpdate()
    
end

function Entity:Draw()
    
end

function Entity:Update()
    self:OnUpdate()
    for _, component in pairs(self.Component) do
        component:Update()
        component:Draw()
    end
    self.EventManager:Update(self)
    self:Draw()
end
