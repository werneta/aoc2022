#!/usr/bin/env lua

require "day02"

elf_map = {
    A = Plays.ROCK,
    B = Plays.PAPER,
    C = Plays.SCISSORS
}

me_lose = "X"
me_draw = "Y"
me_win = "Z"

score = 0

fname = arg[1]

file = assert(io.open(fname, "r"))

game = file:read("*line")
repeat
    elf = elf_map[game:sub(1,1)]
    me = game:sub(3,3)

    if (me == me_lose) then
        score = score + score_map.lose + beat_map[elf]
    elseif (me == me_draw) then
        score = score + score_map.draw + score_map[elf]
    else
        score = score + score_map.win + lose_map[elf]
    end

    game = file:read("*line")
until game == nil

file:close()

print(score)
