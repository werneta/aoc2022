#!/usr/bin/env lua

fname = arg[1]

file = assert(io.open(fname, "r"))

stacks = {}
stackup = true
row = file:read("*line")
repeat
    row_done = false

    if (row == "") then
        stackup = false
    end

    if stackup then
        for i = 1, #row, 4 do
            stack = (i + 4) // 4
            crate = row:sub(i + 1, i + 1)
            if stacks[stack] == nil then
                table.insert(stacks, stack, {})
            end
            if row:sub(i, i) == "[" and crate ~= " " then
                table.insert(stacks[stack], 1, crate)
            end
        end
    elseif row ~= "" then
        _, _, num, from, to = string.find(row, "move (%d+) from (%d+) to (%d+)")
        from = stacks[tonumber(from)]
        to = stacks[tonumber(to)]

        for i = 1, num do
            table.insert(to, #to + 1, table.remove(from))
        end
    end

    row = file:read("*line")
until row == nil

for _, stack in ipairs(stacks) do
    io.write(stack[#stack])
end

file:close()
