-- Component

function Component(name, all)
    local t = all
    t.__id = name
    t.Update, t.Draw = t.Update or function () end, t.Draw or function () end
    return t
end
