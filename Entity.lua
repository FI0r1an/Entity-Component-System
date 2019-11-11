Entity = {
    __id = "Entity",
    __number = 1,
    Component = {},
    GetComponent = function (self, id)
        return self.Component[id]
    end,
    DestroyComponent = function (self, id)
        self.Component[id] = nil
    end,
    UpdateEvent = function () end,
    Update = function (self)
        self:UpdateEvent()
        for k, v in pairs(self.Component) do
            v:Update(self)
        end
    end
}
function Entity:New(t, i)
    local a = setmetatable(t or {}, self)
    self.__index = self
    if i then
        i(a)
    end
    return a
end
