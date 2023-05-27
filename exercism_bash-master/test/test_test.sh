#!/usr/bin/env bats

@test "correct arguments" {
    run bash test_test.sh alice
    
    [ "$status" -eq 0 ]
    [ "$output" = "HELLO, ALICE" ]
}

@test "one long argument" {
    run bash test_test.sh "Alice and Bob"
    
    [ "$status" -eq 0 ]
    [ "$output" = "HELLO, ALICE AND BOB" ]
}

@test "incorrect arguments" {
    skip
    run bash error_handling.sh Alice Bob

    [ "$status" -ne 0 ]
}

@test "use errexit" {
    skip
    source error_handling.sh
    [ echo $SHELLOPTS | grep -q 'errexit' ]
}

@test "use nounset" {
    skip
    source error_handling.sh
    [ echo $SHELLOPTS | grep -q 'nounset' ]
}
