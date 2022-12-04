#!/usr/bin/env lua

require "day04"

function inside(llim, val, ulim)
    return ((llim <= val) and (val <= ulim))
end

redundant = 0

for i, row in ipairs(rows) do
    if (inside(row.start1, row.start2, row.end1) or
        inside(row.start1, row.end2, row.end1) or
        inside(row.start2, row.start1, row.end2) or
        inside(row.start2, row.end1, row.end2)) then
        redundant = redundant + 1
    end
end

print(redundant)
