#!/usr/bin/bats

# Copyright (C) 2021 Peter Hoffmann
# SPDX-License-Identifier: GPL-3.0-only

source test-helper

### general_trap tests
@test 'general_trap' {
  skip 'TODO: write tests'
}

### is_true tests
@test 'is_true true' {
  run is_true true
  assert_equal 0 ''
}
@test 'is_true True' {
  run is_true True
  assert_equal 0 ''
}
@test 'is_true yes' {
  run is_true yes
  assert_equal 0 ''
}
@test 'is_true Yes' {
  run is_true Yes
  assert_equal 0 ''
}
@test 'is_true y' {
  run is_true y
  assert_equal 0 ''
}
@test 'is_true Y' {
  run is_true Y
  assert_equal 0 ''
}
@test 'is_true false' {
  run is_true false
  assert_equal 1 ''
}
@test 'is_true False' {
  run is_true False
  assert_equal 1 ''
}
@test 'is_true no' {
  run is_true no
  assert_equal 1 ''
}
@test 'is_true No' {
  run is_true No
  assert_equal 1 ''
}
@test 'is_true n' {
  run is_true n
  assert_equal 1 ''
}
@test 'is_true N' {
  run is_true N
  assert_equal 1 ''
}
@test 'is_true anything' {
  run is_true anything
  assert_equal 1 ''
}

### is_false tests
@test 'is_false false' {
  run is_false false
  assert_equal 0 ''
}
@test 'is_false False' {
  run is_false False
  assert_equal 0 ''
}
@test 'is_false no' {
  run is_false no
  assert_equal 0 ''
}
@test 'is_false No' {
  run is_false No
  assert_equal 0 ''
}
@test 'is_false n' {
  run is_false n
  assert_equal 0 ''
}
@test 'is_false N' {
  run is_false N
  assert_equal 0 ''
}
@test 'is_false true' {
  run is_false true
  assert_equal 1 ''
}
@test 'is_false True' {
  run is_false True
  assert_equal 1 ''
}
@test 'is_false yes' {
  run is_false yes
  assert_equal 1 ''
}
@test 'is_false Yes' {
  run is_false Yes
  assert_equal 1 ''
}
@test 'is_false y' {
  run is_false y
  assert_equal 1 ''
}
@test 'is_false Y' {
  run is_false Y
  assert_equal 1 ''
}
@test 'is_false anything' {
  run is_false anything
  assert_equal 1 ''
}

### is_positive_integer tests
@test 'is_positive_integer 1' {
  run is_positive_integer 1
  assert_equal 0 ''
}
@test 'is_positive_integer 01' {
  run is_positive_integer 01
  assert_equal 0 ''
}
@test 'is_positive_integer 42' {
  run is_positive_integer 42
  assert_equal 0 ''
}
@test 'is_positive_integer 0' {
  run is_positive_integer 0
  assert_equal 1 ''
}
@test 'is_positive_integer 00' {
  run is_positive_integer 00
  assert_equal 1 ''
}
@test 'is_positive_integer -1' {
  run is_positive_integer -1
  assert_equal 1 ''
}
@test 'is_positive_integer string' {
  run is_positive_integer string
  assert_equal 1 ''
}

### Log tests
@test 'Log line' {
  run Log line
  assert_equal 0 ''
}
@test 'LOG=true Log line' {
  export LOG=true
  run Log line
  assert_regexp 0 "^${iso8601ns} line$"
}
@test 'echo line | Log' {
  run bash -c 'source base; echo line | Log'
  assert_equal 0 ''
}
@test 'LOG=true echo line | Log' {
  export LOG=true
  run bash -c 'source base; echo line | Log'
  assert_regexp 0 "^${iso8601ns} line$"
}
@test 'echo -e \"line1\\nline2\" | Log' {
  run bash -c 'source base; echo -e "line1\nline2" | Log'
  assert_equal 0 ''
}
@test 'LOG=true echo -e \"line1\\nline2\" | Log' {
  export LOG=true
  run bash -c 'source base; echo -e "line1\nline2" | Log'
  assert_regexp 0 "^${iso8601ns} line1$" "${lines[0]?}"
  assert_regexp 0 "^${iso8601ns} line2$" "${lines[1]?}"
}

### Info tests
@test 'Info line' {
  run Info line
  assert_equal 0 ''
}
@test 'LOG=true Info line' {
  export LOG=true
  run Info line
  assert_regexp 0 "^${iso8601ns} line$"
}
@test 'VERBOSE=true Info line' {
  export VERBOSE=true
  run Info line
  assert_equal 0 'line'
}
@test 'LOG=true VERBOSE=true Info line' {
  export LOG=true VERBOSE=true
  run Info line
  assert_regexp 0 "^${iso8601ns} line$" "${lines[0]?}"
  assert_equal 0 'line' "${lines[1]?}"
}
@test 'echo line | Info' {
  run bash -c 'source base; echo line | Info'
  assert_equal 0 ''
}
@test 'LOG=true echo line | Info' {
  export LOG=true
  run bash -c 'source base; echo line | Info'
  assert_regexp 0 "^${iso8601ns} line$"
}
@test 'VERBOSE=true echo line | Info' {
  export VERBOSE=true
  run bash -c 'source base; echo line | Info'
  assert_equal 0 'line'
}
@test 'LOG=true VERBOSE=true echo line | Info' {
  export LOG=true VERBOSE=true
  run bash -c 'source base; echo line | Info'
  assert_regexp 0 "^${iso8601ns} line$" "${lines[0]?}"
  assert_equal 0 'line' "${lines[1]?}"
}
@test 'echo -e \"line1\\nline2\" | Info' {
  run bash -c 'source base; echo -e "line1\nline2" | Info'
  assert_equal 0 ''
}
@test 'LOG=true echo -e \"line1\\nline2\" | Info' {
  export LOG=true
  run bash -c 'source base; echo -e "line1\nline2" | Info'
  assert_regexp 0 "^${iso8601ns} line1$" "${lines[0]?}"
  assert_regexp 0 "^${iso8601ns} line2$" "${lines[1]?}"
}
@test 'VERBOSE=true echo -e \"line1\\nline2\" | Info' {
  export VERBOSE=true
  run bash -c 'source base; echo -e "line1\nline2" | Info'
  assert_equal 0 'line1' "${lines[0]?}"
  assert_equal 0 'line2' "${lines[1]?}"
}
@test 'LOG=true VERBOSE=true echo -e \"line1\\nline2\" | Info' {
  export LOG=true VERBOSE=true
  run bash -c 'source base; echo -e "line1\nline2" | Info'
  assert_regexp 0 "^${iso8601ns} line1$" "${lines[0]?}"
  assert_equal 0 'line1' "${lines[1]?}"
  assert_regexp 0 "^${iso8601ns} line2$" "${lines[2]?}"
  assert_equal 0 'line2' "${lines[3]?}"
}

### Print tests
@test 'Print line' {
  run Print line
  assert_equal 0 'line'
}
@test 'LOG=true Print line' {
  export LOG=true
  run Print line
  assert_regexp 0 "^${iso8601ns} line$" "${lines[0]?}"
  assert_equal 0 'line' "${lines[1]?}"
}
@test 'echo line | Print' {
  run Print line
  assert_equal 0 'line'
}
@test 'LOG=true echo line | Print' {
  export LOG=true
  run Print line
  assert_regexp 0 "^${iso8601ns} line$" "${lines[0]?}"
  assert_equal 0 'line' "${lines[1]?}"
}
@test 'echo -e \"line1\\nline2\" | Print' {
  run bash -c 'source base; echo -e "line1\nline2" | Print'
  assert_equal 0 'line1' "${lines[0]?}"
  assert_equal 0 'line2' "${lines[1]?}"
}
@test 'LOG=true echo -e \"line1\\nline2\" | Print' {
  export LOG=true
  run bash -c 'source base; echo -e "line1\nline2" | Print'
  assert_regexp 0 "^${iso8601ns} line1$" "${lines[0]?}"
  assert_equal 0 'line1' "${lines[1]?}"
  assert_regexp 0 "^${iso8601ns} line2$" "${lines[2]?}"
  assert_equal 0 'line2' "${lines[3]?}"
}

### Error tests
@test 'Error' {
  skip 'how to test failing commands?'
  run Error
  assert_regexp 1 "^${iso8601ns} [ERROR] $" "${lines[0]?}"
  assert_equal 1 '[ERROR] ' "${lines[1]?}"
}
@test 'Error message' {
  skip 'how to test failing commands?'
  run Error message
  assert_regexp 1 "^${iso8601ns} [ERROR] message$" "${lines[0]?}"
  assert_equal 1 '[ERROR] message' "${lines[1]?}"
}
@test 'Error 42 message' {
  skip 'how to test failing commands?'
  run Error 42 message
  assert_regexp 42 "^${iso8601ns} [ERROR] message$" "${lines[0]?}"
  assert_equal 42 '[ERROR] message' "${lines[1]?}"
}
