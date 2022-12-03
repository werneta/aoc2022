#!/usr/bin/env lua

require "day02"

elf_map = {A = Plays.ROCK, B = Plays.PAPER, C = Plays.SCISSORS}
me_map = {X = Plays.ROCK, Y = Plays.PAPER, Z = Plays.SCISSORS}

score = 0

fname = arg[1]

file = assert(io.open(fname, "r"))

game = file:read("*line")
repeat
    elf = elf_map[game:sub(1,1)]
    me = me_map[game:sub(3,3)]

    score = score + score_map[me]

    if draws(me, elf) then
        score = score + score_map.draw
    end

    if wins(me, elf) then
        score = score + score_map.win
    end

    game = file:read("*line")
until game == nil

file:close()

print(score)
