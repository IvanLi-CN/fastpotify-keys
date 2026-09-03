# Testing

Fastpotify Keys validates its behavior at four layers.

- Core unit tests cover media-key decoding, forwarding readiness, executable discovery, CLI arguments, timeouts, and the preservation of distinct media-key gestures.
- macOS CI runs core tests and builds the app with full Xcode.
- Release validation verifies both universal architectures, the Ad Hoc signature, DMG mountability, and published SHA-256 checksums.
- A real Mac release checklist covers Accessibility authorization changes, target liveness, another player in the foreground, sleep/wake, and event-tap recovery.

The real-Mac checklist is a release gate because CI cannot grant Accessibility authorization or reproduce physical media-key routing.

Because V1 supports macOS 13 and later, a release must include a real macOS 13 validation run for every architecture it claims to support. A build-only deployment-target check is not evidence that Accessibility and physical media-key routing work on that system.
