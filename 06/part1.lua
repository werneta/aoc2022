#!/usr/bin/env lua

fname = arg[1]

file = assert(io.open(fname, "r"))

stream = file:read("*line")

for n = 1, (#stream - 4) do
    word = stream:sub(n, n + 3)
    match = false
    for i = 1, 4 do
        c = word:sub(i, i)
        for j = i + 1, 4 do
            if c == word:sub(j, j) then
                match = true
                break
            end
        end
        if match then
            break
        end
    end
    if not match then
        print(n + 3)
        break
    end
end

file:close()
