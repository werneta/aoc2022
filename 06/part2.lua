#!/usr/bin/env lua

fname = arg[1]

file = assert(io.open(fname, "r"))

stream = file:read("*line")

len = 14
for n = 1, (#stream - len) do
    word = stream:sub(n, n + len - 1)
    match = false
    for i = 1, len do
        c = word:sub(i, i)
        for j = i + 1, len do
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
        print(n + len - 1)
        break
    end
end

file:close()
