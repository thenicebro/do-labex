#!/usr/bin/env bats

@test "sentence empty" {
    run bash ~/project/pangram.sh ""
    [ "$status" -eq 1 ]
}

@test "pangram with only lower case" {
    run bash ~/project/pangram.sh "the quick brown fox jumps over the lazy dog"
    [ "$status" -eq 0 ]
}

@test "missing character 'x'" {
    run bash ~/project/pangram.sh "a quick movement of the enemy will jeopardize five gunboats"
    [ "$status" -eq 1 ]
}

@test "another missing character 'x'" {
    run bash ~/project/pangram.sh "the quick brown fish jumps over the lazy dog"
    [ "$status" -eq 1 ]
}

@test "pangram with underscores" {
    run bash ~/project/pangram.sh "the_quick_brown_fox_jumps_over_the_lazy_dog"
    [ "$status" -eq 0 ]
}

@test "pangram with numbers" {
    run bash ~/project/pangram.sh "the 1 quick brown fox jumps over the 2 lazy dogs"
    [ "$status" -eq 0 ]
}

@test "missing letters replaced by numbers" {
    run bash ~/project/pangram.sh "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
    [ "$status" -eq 1 ]
}

@test "pangram with mixed case and punctuation" {
    run bash ~/project/pangram.sh "Five quacking Zephyrs jolt my wax bed."
    [ "$status" -eq 0 ]
}

@test "upper and lower case versions of the same character should not be counted separately" {
    run bash ~/project/pangram.sh "the quick brown fox jumped over the lazy FOX"
    [ "$status" -eq 1 ]
}

