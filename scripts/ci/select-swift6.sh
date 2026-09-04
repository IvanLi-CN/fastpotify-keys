#!/usr/bin/env bash
set -euo pipefail

selected_developer_dir=""
while IFS= read -r xcode_app; do
    developer_dir="$xcode_app/Contents/Developer"
    if [[ ! -d "$developer_dir" ]]; then
        continue
    fi
    swift_binary="$(DEVELOPER_DIR="$developer_dir" xcrun --find swift 2>/dev/null || true)"
    if [[ -x "$swift_binary" ]] && "$swift_binary" --version | grep -q 'Apple Swift version 6\.'; then
        selected_developer_dir="$developer_dir"
        break
    fi
done < <(find /Applications -maxdepth 1 -type d -name 'Xcode*.app' -print | sort -r)

if [[ -z "$selected_developer_dir" ]]; then
    printf 'No Swift 6 Xcode toolchain was found on this runner.\n' >&2
    swift --version >&2 || true
    exit 1
fi

sudo xcode-select --switch "$selected_developer_dir"
printf 'Selected developer directory: %s\n' "$selected_developer_dir"
swift --version
