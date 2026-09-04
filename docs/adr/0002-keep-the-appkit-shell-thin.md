# Use MenuBarExtra with a thin AppKit bridge around a testable Swift core

The app uses SwiftUI's `MenuBarExtra` as its only visible scene and a local Swift package for media-key decoding, forwarding policy, executable discovery, and command dispatch. A narrow `@NSApplicationDelegateAdaptor` bridge owns the AppKit and Core Graphics lifecycle needed by the event tap. This separates macOS lifecycle and Accessibility concerns from the correctness-critical logic that needs fast unit tests, while avoiding an extra build system or third-party framework.

## Consequences

The macOS app target owns the menu-bar surface, event-tap lifecycle, Accessibility prompt, and login-item integration. The core package must not depend on AppKit and remains testable through Swift Package Manager. Swift 6 complete strict concurrency is enabled: UI stays main-actor isolated, while the core owns its serial dispatch boundary and narrowly contains the C callback bridge. Because the product supports macOS 13, view state uses `ObservableObject` and `@Published` rather than the macOS 14-only Observation macros.
