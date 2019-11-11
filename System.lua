System = function ()
    return {
        Entity = {},
        Add = function (self, entity, number)
            self.Entity[entity.__id] = self.Entity[entity.__id] or {}
            self.Entity[entity.__id][number or entity.__number] = entity
        end,
        Destroy = function (self, enid, num)
            if type(enid) == "string" then
                self.Entity[enid][num] = nil
            else
                self.Entity[enid.__id][enid.__number] = nil
            end
        end,
        Update = function (self)
            for k, v in pairs(self.Entity) do
                for _, V in pairs(v) do
                    V:Update()
                end
            end
        end
    }
end
