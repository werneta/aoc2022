function get_priority(c)
    local prio

    if ("a" <= c) and (c <= "z") then
        prio = c:byte() - ("a"):byte() + 1
    else
        prio = c:byte() - ("A"):byte() + 27
    end
    return prio
end
