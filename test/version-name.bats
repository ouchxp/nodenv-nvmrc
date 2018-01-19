#!/usr/bin/env bats

load test_helper

@test 'Which recognizes node version in .nvmrc' {
  create_version 4.2.1
  cd_into_dir 4.2.1
  run nodenv version-name
  assert_success "4.2.1"
}

