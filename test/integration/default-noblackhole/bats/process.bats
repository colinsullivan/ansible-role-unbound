#!/usr/bin/env bats

setup() {
    apt-get install -y ldnsutils >/dev/null || yum -y install bind-utils >/dev/null
}

@test "process unbound should be running" {
    run pgrep unbound
    [ "$status" -eq 0 ]
    [[ "$output" != "" ]]
}

@test "resolv.conf should be pointing at 127.0.0.1" {
    run cat /etc/resolv.conf
    [ "$status" -eq 0 ]
    [[ "$output" =~ "127.0.0.1" ]]
}

