#!/usr/bin/env bats

@test "correct arguments" {
    run bash ~/project/error_handling.sh Alice
    
    [ "$status" -eq 0 ]
    [ "$output" = "Hello, Alice" ]
}

@test "one long argument" {
    run bash ~/project/error_handling.sh "Alice and Bob"
    
    [ "$status" -eq 0 ]
    [ "$output" = "Hello, Alice and Bob" ]
}

@test "incorrect arguments" {
    run bash ~/project/error_handling.sh Alice Bob

    [ "$status" -ne 0 ]
}

@test "use errexit" {
    source error_handling.sh
    [ echo $SHELLOPTS | grep -q 'errexit' ]
}

@test "use nounset" {
    source error_handling.sh
    [ echo $SHELLOPTS | grep -q 'nounset' ]
}
