-- System

System = Class()

function System:Init(name)
    self.Entity = {}
    self.Name = name
end

function System:AddEntity(entity)
    table.insert(self.Entity, entity)
end

function System:RemoveEntity(name, id)
    for k, v in pairs(self.Entity) do
        if v.Name == name then
            if id and v.__id ~= id then
                break
            end
        end
        table.remove(self.Entity, k)
    end
end

function System:GetEntity(name, id)
    local t
    for k, v in pairs(self.Entity) do
        if v.Name == name then
            t = v
            if id then
                if id == v.__id then
                    t = v
                else
                    t = nil
                end
            end
        end
    end
    return t
end

function System:Update()
    for k, v in ipairs(self.Entity) do
        v:Update()
    end
end
