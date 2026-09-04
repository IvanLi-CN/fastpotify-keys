import SwiftUI

@main
struct FastpotifyKeysApp: App {
    @NSApplicationDelegateAdaptor(ApplicationDelegate.self) private var applicationDelegate

    var body: some Scene {
        MenuBarExtra("Fastpotify Keys", systemImage: "music.note") {
            FastpotifyKeysMenu(state: applicationDelegate.state)
        }
        .menuBarExtraStyle(.menu)
    }
}

private struct FastpotifyKeysMenu: View {
    @ObservedObject var state: AppState

    var body: some View {
        Text(state.statusTitle)
        Text(state.statusDetail)
            .font(.caption)
            .foregroundStyle(.secondary)

        Divider()

        Toggle("Forward media keys", isOn: $state.forwardingEnabled)
            .onChange(of: state.forwardingEnabled) { newValue in
                state.setForwardingEnabled(newValue)
            }

        Button("Choose Fastpotify…", action: state.chooseTarget)
        Button("Open Accessibility Settings", action: state.openAccessibilitySettings)

        Toggle("Launch at login", isOn: $state.launchAtLogin)
            .onChange(of: state.launchAtLogin) { newValue in
                state.setLaunchAtLogin(newValue)
            }

        Divider()

        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }
    }
}
