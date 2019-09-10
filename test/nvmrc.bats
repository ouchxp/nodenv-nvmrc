#!/usr/bin/env bats

load test_helper

@test 'Recognizes simple node version' {
  create_version 4.2.1
  cd_into_dir 4.2.1
  run nodenv nvmrc
  assert_success '4.2.1'
}

@test 'Recognizes semver range matching an installed version' {
  create_version 4.2.1
  cd_into_dir '>= 4.0.0'
  run nodenv nvmrc
  assert_success '4.2.1'
}

@test 'Prefers the greatest installed version matching a range' {
  create_version 4.0.0
  create_version 4.2.1
  cd_into_dir '^4.0.0'
  run nodenv nvmrc
  assert_success '4.2.1'
}

@test 'Ignores non-matching installed versions' {
  create_version 0.12.7
  cd_into_dir '>= 4.0.0'
  run nodenv nvmrc
  assert [ "$output" = '>= 4.0.0' ]
  assert [ "$status" -eq 0 ]
}

@test 'Prefers `nodenv local` over .nvmrc' {
  create_version 5.0.0
  cd_into_dir 4.2.1
  nodenv local 5.0.0
  run nodenv nvmrc
  assert_success ''
}

@test 'Returns version expression that is not semver version' {
  create_version lts
  cd_into_dir lts
  run nodenv nvmrc
  assert [ "$status" -eq 0 ]
  assert_success 'lts'
}
