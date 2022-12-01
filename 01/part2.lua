#!/usr/bin/env lua

fname = 'input.txt'
calories = {0}

file = io.open(fname, "r")

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

table.sort(calories)

print(calories[#calories] + calories[#calories - 1] + calories[#calories - 2])
