#!/usr/bin/env lua

function day05(fname, keep_order)
    fname = arg[1]

    file = assert(io.open(fname, "r"))

    stacks = {}
    stackup = true
    row = file:read("*line")
    repeat
        row_done = false

        if (row == "") then
            -- Switching from parsing the initial stackup to the move commands
            stackup = false
        elseif stackup then
            -- Group the text row into sets of 4 characters
            for i = 1, #row, 4 do
                stack = (i + 4) // 4
                if stacks[stack] == nil then
                    -- Make sure we have a stack in place
                    table.insert(stacks, stack, {})
                end
                if row:sub(i, i) == "[" then
                    -- Got a crate, push it to the end of the correct stack
                    crate = row:sub(i + 1, i + 1)
                    table.insert(stacks[stack], 1, crate)
                end
            end
        else
            -- Lua captures are not terrible
            _, _, num, from, to = string.find(row,
                "move (%d+) from (%d+) to (%d+)")
            -- ... sure would be nice if I got numbers when I asked for numbers
            from = stacks[tonumber(from)]
            to = stacks[tonumber(to)]

            if not keep_order then
                -- Part 1
                from_idx = nil
            else 
                -- Part 2
                from_idx = #from - num + 1
            end
            -- Remove values from the right location in the source and append to
            -- the destination
            for i = 1, num do
                table.insert(to, #to + 1, table.remove(from, from_idx))
            end
        end

        row = file:read("*line")
    until row == nil

    for _, stack in ipairs(stacks) do
        io.write(stack[#stack])
    end
    print()

    file:close()
end
