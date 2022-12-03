#!/usr/bin/env lua

elf_rock = "A"
elf_paper = "B"
elf_scissors = "C"

me_rock = "X"
me_paper = "Y"
me_scissors = "Z"

rock_score = 1
paper_score = 2
scissor_score = 3

lose_score = 0
draw_score = 3
win_score = 6

score = 0

fname = arg[1]

file = assert(io.open(fname, "r"))

game = file:read("*line")
repeat
    elf = game:sub(1,1)
    me = game:sub(3,3)

    if (me == me_rock) then
        score = score + rock_score
    elseif (me == me_paper) then
        score = score + paper_score
    elseif (me == me_scissors) then
        score = score + scissor_score
    end

    if (((me == me_rock) and (elf == elf_rock)) or
        ((me == me_paper) and (elf == elf_paper)) or
        ((me == me_scissors) and (elf == elf_scissors))) then

        score = score + draw_score
    end

    if (((me == me_rock) and (elf == elf_scissors)) or
        ((me == me_paper) and (elf == elf_rock)) or
        ((me == me_scissors) and (elf == elf_paper))) then

        score = score + win_score
    end


    game = file:read("*line")
until game == nil

file:close()

print(score)
