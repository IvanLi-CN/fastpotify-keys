# Use macOS 13 as the V1 deployment target

V1 supports macOS 13.0 and later. The SwiftPM manifest and its app and core targets will declare that deployment target.

## Decision Drivers

macOS 13 is the earliest version that provides both SwiftUI `MenuBarExtra` and `SMAppService.mainApp`, so it permits the chosen menu-bar and login-item design without availability branches or legacy APIs. The core media-key path, Accessibility authorization, process execution, and Ad Hoc distribution do not gain a required capability on macOS 14.

Keeping macOS 13 preserves compatibility with Ventura-capable Intel Macs while retaining the modern application shell. The V1 state model uses `ObservableObject` and `@Published` instead of the macOS 14 Observation macros, and the core package uses XCTest as its compatibility test baseline. Swift Testing may coexist in a future macOS 14-only test surface without raising the product deployment target.

## Consequences

Every V1 release must validate the actual event-tap and Accessibility behavior on macOS 13 for each architecture advertised in the universal artifact. A successful current-macOS CI build or a Mach-O minimum-version marker alone does not establish that support.
