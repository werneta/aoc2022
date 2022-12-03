#!/usr/bin/env lua

require "day03"

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
            sum = sum + get_priority(c)
            break
        end
    end

    rucksack = file:read("*line")
until rucksack == nil

file:close()

print(sum)
