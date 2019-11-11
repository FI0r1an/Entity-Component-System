Component = function (name, t)
    t.__id = name
    return setmetatable(t, {
        __call = function (self, entity)
            entity.Component[self.__id] = setmetatable({}, self)
            self.__index = self
        end
    })
end
