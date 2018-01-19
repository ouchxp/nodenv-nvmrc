#!/usr/bin/env bats

load test_helper

@test 'Which recognizes node version in .nvmrc' {
  create_version 4.2.1
  cd_into_dir 4.2.1
  run nodenv which node
  assert_success "${NODENV_ROOT}/versions/4.2.1/bin/node"
}

@test 'Exits with error when node version in .nvmrc is not installed' {
  cd_into_dir 4.2.1
  run nodenv which node
  assert echo "$output" | grep 'no version satisfying'
  assert [ "$status" -eq 1 ]
}

@test 'Exits with error when no node version matching a range is installed' {
  cd_into_dir "4.0 - 5.0"
  run nodenv which node
  assert [ "$status" -eq 1 ]
}
