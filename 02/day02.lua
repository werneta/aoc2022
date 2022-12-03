#!/usr/bin/env lua

-- h/t https://unendli.ch/posts/2016-07-22-enumerations-in-lua.html
function enum(tbl)
    local length = #tbl
    for i = 1, length do
        local v = tbl[i]
        tbl[v] = i
    end

    return tbl
end

function draws(a, b)
    return a == b
end

function wins(first, second)
    return (((first == Plays.ROCK) and (second == Plays.SCISSORS)) or
            ((first == Plays.PAPER) and (second == Plays.ROCK)) or
            ((first == Plays.SCISSORS) and (second == Plays.PAPER)))
end

Plays = enum {
    "ROCK",
    "PAPER",
    "SCISSORS"
}

beat_map = {
    [Plays.ROCK] = Plays.SCISSORS,
    [Plays.PAPER] = Plays.ROCK,
    [Plays.SCISSORS] = Plays.PAPER
}

lose_map = {
    [Plays.ROCK] = Plays.PAPER,
    [Plays.PAPER] = Plays.SCISSORS,
    [Plays.SCISSORS] = Plays.ROCK
}

score_map = {
    [Plays.ROCK] = 1,
    [Plays.PAPER] = 2,
    [Plays.SCISSORS] = 3,
    win = 6,
    draw = 3,
    lose = 0
}

