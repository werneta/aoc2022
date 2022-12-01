#!/usr/bin/env lua

fname = arg[1]
calories = {0}

file = assert(io.open(fname, "r"))

repeat
    meal = file:read("*line")
    if meal == '' then
        table.insert(calories, 0)
        meal = file:read("*line")
    end

    if meal ~= nil then
        calories[#calories] = calories[#calories] + tonumber(meal)
    end
until meal == nil

file:close()
