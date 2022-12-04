#!/usr/bin/env lua

require "day04"

redundant = 0

for i, row in ipairs(rows) do
    if (((row.start1 <= row.start2) and (row.end2 <= row.end1)) or
        ((row.start2 <= row.start1) and (row.end1 <= row.end2))) then
        redundant = redundant + 1
    end
end

print(redundant)
