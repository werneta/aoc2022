#!/usr/bin/env lua

require "day03"

function get_sacks(file)
    return {file:read("*line"), file:read("*line"), file:read("*line")}
end

fname = arg[1]
file = assert(io.open(fname, "r"))

sum = 0

sacks = get_sacks(file)
repeat
    for c in sacks[1]:gmatch(".") do
        if sacks[2]:find(c) and sacks[3]:find(c) then
            sum = sum + get_priority(c)
            break
        end
    end

    sacks =  get_sacks(file)
until sacks[1] == nil

file:close()

print(sum)
