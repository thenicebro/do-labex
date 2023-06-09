#!/usr/bin/env bats

@test "encode yes" {
    run bash ~/project/atbash_cipher.sh encode "yes"
    [ "$status" -eq 0 ]
    [ "$output" = "bvh" ]
}

@test "encode no" {
    run bash ~/project/atbash_cipher.sh encode "no"
    [ "$status" -eq 0 ]
    [ "$output" = "ml" ]
}

@test "encode OMG" {
    run bash ~/project/atbash_cipher.sh encode "OMG"
    [ "$status" -eq 0 ]
    [ "$output" = "lnt" ]
}

@test "encode spaces" {
    run bash ~/project/atbash_cipher.sh encode "O M G"
    [ "$status" -eq 0 ]
    [ "$output" = "lnt" ]
}

@test "encode mindblowingly" {
    run bash ~/project/atbash_cipher.sh encode "mindblowingly"
    [ "$status" -eq 0 ]
    [ "$output" = "nrmwy oldrm tob" ]
}

@test "encode numbers" {
    run bash ~/project/atbash_cipher.sh encode "Testing,1 2 3, testing."
    [ "$status" -eq 0 ]
    [ "$output" = "gvhgr mt123 gvhgr mt" ]
}

@test "encode deep thought" {
    run bash ~/project/atbash_cipher.sh encode "Truth is fiction."
    [ "$status" -eq 0 ]
    [ "$output" = "gifgs rhurx grlm" ]
}

@test "encode all the letters" {
    run bash ~/project/atbash_cipher.sh encode "The quick brown fox jumps over the lazy dog."
    [ "$status" -eq 0 ]
    [ "$output" = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" ]
}

@test "decode exatbash-cipherercism" {
    run bash ~/project/atbash_cipher.sh decode "vcvix rhn"
    [ "$status" -eq 0 ]
    [ "$output" = "exercism" ]
}

@test "decode a sentence" {
    run bash ~/project/atbash_cipher.sh decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
    [ "$status" -eq 0 ]
    [ "$output" = "anobstacleisoftenasteppingstone" ]
}

@test "decode numbers" {
    run bash ~/project/atbash_cipher.sh decode "gvhgr mt123 gvhgr mt"
    [ "$status" -eq 0 ]
    [ "$output" = "testing123testing" ]
}

@test "decode all the letters" {
    run bash ~/project/atbash_cipher.sh decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    [ "$status" -eq 0 ]
    [ "$output" = "thequickbrownfoxjumpsoverthelazydog" ]
}
