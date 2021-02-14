#!/bin/bash

# Copyright (C) 2021 Peter Hoffmann
# SPDX-License-Identifier: GPL-3.0-only

set -eEuo pipefail
source /usr/share/shell-scripts/lib/git
is_true "$DEBUG" && set -x

### Functions

function main {
  :
}

### Main

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi
