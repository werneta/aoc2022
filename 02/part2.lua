#!/usr/bin/env lua

elf_rock = "A"
elf_paper = "B"
elf_scissors = "C"

me_lose = "X"
me_draw = "Y"
me_win = "Z"

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

    if (me == me_lose) then
        score = score + lose_score
        if (elf == elf_rock) then
            score = score + scissor_score
        elseif (elf == elf_scissors) then
            score = score + paper_score
        else
            score = score + rock_score
        end
    elseif (me == me_draw) then
        score = score + draw_score
        if (elf == elf_rock) then
            score = score + rock_score
        elseif (elf == elf_scissors) then
            score = score + scissor_score
        else
            score = score + paper_score
        end
    else
        score = score + win_score
        if (elf == elf_rock) then
            score = score + paper_score
        elseif (elf == elf_scissors) then
            score = score + rock_score
        else
            score = score + scissor_score
        end
    end

    game = file:read("*line")
until game == nil

file:close()

print(score)
