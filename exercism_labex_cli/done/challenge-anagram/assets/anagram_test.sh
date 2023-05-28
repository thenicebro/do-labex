#!/usr/bin/env bats

@test "no matches", {
    run bash ~/project/anagram.sh "diaper" "hello world zombies pants"
    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}

@test "detects simple anagram" {
    run bash ~/project/anagram.sh "ant" "tan stand at"
    [ "$status" -eq 0 ]
    [ "$output" = "tan" ]
}

@test "does not detect false positives" {
    run bash ~/project/anagram.sh "galea" "eagle"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "detects two anagrams" {
    run bash ~/project/anagram.sh "master" "stream pigeon maters"

    [ "$status" -eq 0 ]
    [ "$output" = "stream maters" ]
}
@test "does not detect anagram subsets" {
    run bash ~/project/anagram.sh "good" "dog goody"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "detects anagram" {
    run bash ~/project/anagram.sh "listen" "enlists google inlets banana"

    [ "$status" -eq 0 ]
    [ "$output" = "inlets" ]
}
@test "detects three anagrams" {
    run bash ~/project/anagram.sh "allergy" "gallery ballerina regally clergy largely leading"

    [ "$status" -eq 0 ]
    [ "$output" = "gallery regally largely" ]
}
@test "does not detect identical words" {
    run bash ~/project/anagram.sh "corn" "corn dark Corn rank CORN cron park"

    [ "$status" -eq 0 ]
    [ "$output" = "cron" ]
}
@test "does not detect non-anagrams with identical checksum" {
    run bash ~/project/anagram.sh "mass" "last"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "detects anagrams case-insensitively" {
    run bash ~/project/anagram.sh "Orchestra" "cashregister Carthorse radishes"

    [ "$status" -eq 0 ]
    [ "$output" = "Carthorse" ]
}
@test "detects anagrams using case-insensitive subject" {
    run bash ~/project/anagram.sh "Orchestra" "cashregister carthorse radishes"

    [ "$status" -eq 0 ]
    [ "$output" = "carthorse" ]
}
@test "detects anagrams using case-insensitive possible matches" {
    run bash ~/project/anagram.sh "orchestra" "cashregister Carthorse radishes"

    [ "$status" -eq 0 ]
    [ "$output" = "Carthorse" ]
}
@test "does not detect a word as its own anagram" {
    run bash ~/project/anagram.sh "banana" "Banana"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "does not detect a anagram if the original word is repeated" {
    run bash ~/project/anagram.sh "go" "go Go GO"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "anagrams must use all letters exactly once" {
    run bash ~/project/anagram.sh "tapper" "patter"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}
@test "capital word is not own anagram" {
    run bash ~/project/anagram.sh "BANANA" "Banana"

    [ "$status" -eq 0 ]
    [ "$output" = "" ]
}

