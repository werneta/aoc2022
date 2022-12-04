#!/usr/bin/env lua

function get_row(file)
    row = {}
    row.start1 = file:read("*number")
    file:read(1)
    row.end1 = file:read("*number")
    file:read(1)
    row.start2 = file:read("*number")
    file:read(1)
    row.end2 = file:read("*number")

    return row
end

fname = arg[1]
file = assert(io.open(fname, "r"))

rows = {}
row = get_row(file)
repeat
    table.insert(rows, row)
    row = get_row(file)
until row.start1 == nil
file:close()

redundant = 0

for i, row in ipairs(rows) do
    if (((row.start1 <= row.start2) and (row.end2 <= row.end1)) or
        ((row.start2 <= row.start1) and (row.end1 <= row.end2))) then
        redundant = redundant + 1
    end
end

print(redundant)
