# TODO

## Overall structure

- [x] Complete home-manager integration
- [x] All user stuff under `home` (rename to `users`?)
- [ ] Pull in `users/{user}/hosts/{hostname}.nix` in `./users/*/default.nix`
- [ ] Break apart `configuration.nix`
- [x] Modules directory for module config
- [ ] Where to put user, host, or user@host specific module overrides?

## Install and configure

- [x] 1Password
- [ ] Networking
    - [ ] SSHD config
    - [ ] SSH user config
        - [ ] Hosts
        - [x] Keys (1Password integration)
        - [x] Better default settings
    - [x] WireGuard
        - [x] GregDomVPN
        - [x] CSCVPN
    - [ ] Network manager
        - [x] Split DNS for VPNs
        - [ ] VPN roaming (auto on when outside home network)
- [x] ZSH
    - [x] oh-my-zsh
    - [ ] Modern shell tool replacements
- [ ] VSCode
    - [ ] Common extensions
    - [x] Settings (whitespace, font, etc.)
    - [ ] nix env and direnv integration
- [ ] Browsers
    - [ ] Default search engine: Kagi
    - [ ] Auto-open Zoom links in Zoom
    - [ ] Whitelist microphone and camera for GMeet?
    - [ ] Firefox: Always reopen session
    - [ ] Chromium: Always reopen session
    - [ ] Pin 1Pass to extension bar
- [ ] Many apps
    - [ ] Turn off update checks
- [ ] KDE
    - [ ] Dock panel
        - [ ] Pin Firefox, terminal, chrome apps
        - [ ] Dock sizing
    - [ ] Dolphin settings
        - [ ] Pinned places
        - [ ] Documents, Downloads, Music, Pictures, Projects