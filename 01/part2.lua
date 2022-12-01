#!/usr/bin/env lua

require "day01"

table.sort(calories)
sum = calories[#calories] + calories[#calories - 1] + calories[#calories - 2]
print(sum)
