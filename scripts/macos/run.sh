#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
binary="$("$script_dir/build.sh" --configuration debug)"
exec "$binary"
