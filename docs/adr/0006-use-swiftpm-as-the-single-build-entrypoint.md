# Use SwiftPM as the single build entrypoint

The project uses one root Swift Package Manager manifest for the testable core library, the macOS executable, and XCTest targets. Release scripts build each advertised target triple, assemble the executable into a manually structured `.app` bundle, and then perform Ad Hoc signing and DMG packaging. Xcode may open the package as an optional IDE, but no Xcode project or resource compiler is required by the repository.

## Decision Drivers

- The current development environment provides the Swift compiler, macOS SDK, `lipo`, `codesign`, and `hdiutil`, but not `xcodebuild`, `actool`, or `ibtool`.
- The menu-bar app has no nib, storyboard, or Asset Catalog requirement; its visible iconography can use system symbols.
- One manifest keeps local tests, architecture-specific builds, and CI on the same build graph.

## Consequences

The app target remains a native SwiftUI/AppKit executable and can be opened in Xcode when that IDE is available. Local development and Ad Hoc packaging work with Command Line Tools alone, while the release scripts own the bundle metadata and universal merge steps. Future Xcode-specific resources would require a new architectural decision rather than appearing as an implicit build dependency.

This decision supersedes the Xcode-specific build-entry wording in ADR-0002 and ADR-0005; their lifecycle and macOS baseline decisions remain in force.
