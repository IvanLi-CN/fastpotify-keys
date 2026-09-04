# Permissions and Safety

## Accessibility

The app requests Accessibility authorization with the public
`AXIsProcessTrustedWithOptions` API. The initial check asks macOS to show its
standard prompt; later checks are silent. The menu always exposes a direct
link to System Settings > Privacy & Security > Accessibility.

Without authorization, no event tap is installed and all media keys remain
normal system events. Revoking authorization while the app is running is
handled by the periodic status refresh; forwarding becomes unready and the
tap is not re-created until access is restored.

## What the app does not request

- No root or administrator privileges
- No System Extension or privileged helper
- No App Sandbox entitlement
- No Apple Events/Automation permission
- No private MediaRemote or Fastpotify internal socket

The non-sandboxed Ad Hoc boundary is a distribution constraint, not a request
for elevated user privileges. The process is still launched as the logged-in
user and only receives the selected Fastpotify executable and fixed arguments.

## Event-tap failures

If macOS disables the tap once, the controller enables it again. A second
failure within the ten-second recovery window disables forwarding visibly and
persists the off state. A successful installation resets that window. No
failure path replays a consumed event.
