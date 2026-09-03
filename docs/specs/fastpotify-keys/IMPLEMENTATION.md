# Fastpotify Keys 媒体键转发实现状态

> 当前有效规范仍以 `./SPEC.md` 为准；这里记录实现覆盖、交付进度与 rollout 相关事实，避免这些细节散落到 PR / Git 历史里。

## Current Status

- Implementation: 实现中
- Lifecycle: active
- Catalog note: SwiftPM app/core/test targets and Ad Hoc packaging are being added.

## Implementation Coverage

- Requirement coverage: `REQ-FASTPOTIFY-001` through `REQ-FASTPOTIFY-005` are implemented by the Core, App, scripts, workflows, and documentation paths in this repository.
- Verification commands: `swift test`, `scripts/macos/build.sh`, `scripts/macos/package.sh`, and `scripts/macos/verify-release.sh`.
- Rollout facts: releases remain Draft until real macOS 13 Accessibility and physical-key checks pass for each advertised architecture.

## Coverage / rollout summary

- The first implementation slice is being assembled from the fixed macOS 13 baseline.

## Remaining Gaps

- Real macOS 13 arm64 and x86_64 physical-key validation requires access to matching hardware.

## Related Changes

- None. Record PR, commit, review, and compatibility references here; do not add task history to `SPEC.md`.

## References

- `./SPEC.md`
- `./HISTORY.md`
