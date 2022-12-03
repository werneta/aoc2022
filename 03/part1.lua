#!/usr/bin/env lua

fname = arg[1]
file = assert(io.open(fname, "r"))

sum = 0

rucksack = file:read("*line")
repeat
    nitems = #rucksack
    first = rucksack:sub(1, nitems//2)
    second = rucksack:sub(nitems//2 + 1, nitems)

    for c in first:gmatch(".") do
        if second:find(c) then
            if ("a" <= c) and (c <= "z") then
                prio = c:byte() - ("a"):byte() + 1
            else
                prio = c:byte() - ("A"):byte() + 27
            end
            sum = sum + prio
            break
        end
    end

    rucksack = file:read("*line")
until rucksack == nil

file:close()

print(sum)
