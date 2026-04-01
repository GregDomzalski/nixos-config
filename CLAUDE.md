# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a modular NixOS/Home-Manager configuration managing multiple hosts (grd-laptop, grd-workstation) with shared and host-specific configurations.

## Build Commands

```bash
# Rebuild NixOS system
sudo nixos-rebuild switch --flake .#grd-laptop
sudo nixos-rebuild switch --flake .#grd-workstation

# Verify flake syntax
nix flake check

# Update flake inputs
nix flake update

# Show flake outputs
nix flake show

# Build without switching (for testing)
nix build .#nixosConfigurations.grd-laptop.config.system.build.toplevel
```

## Architecture

**Entry Point:** `flake.nix` defines two NixOS configurations using:
- `nixpkgs` (25.11 stable)
- `home-manager` (release-25.11)
- `plasma-manager` (KDE Plasma configuration)
- `nixos-hardware` (for grd-laptop Framework profile)

**Directory Structure:**
- `system/` - System-level NixOS modules (boot, networking, services, programs)
- `home/` - User home-manager configuration and program dotfiles
- `hosts/` - Host-specific configurations and hardware-configuration.nix
- `users/` - User account definitions (separate from home-manager)
- `extensions/` - Custom Nix libraries and modules for improving the syntax and
reusability of common patterns

**Module Loading Order:**
1. Base system (`./system`)
2. Host-specific (`./hosts/{hostname}`)
3. User accounts (`./users/{username}.nix`)
4. Hardware modules
5. Extensions
6. Home-manager with plasma-manager

**Key Pattern:** Each directory's `default.nix` imports child modules. Add new modules by creating a `.nix` file and importing it in the directory's `default.nix`.

## Configuration Passing

Modules receive these via `specialArgs`:
- `inputs` - Flake inputs
- `outputs` - Flake outputs
- `gregos` - Custom library from extensions/lib

Home-manager uses `useGlobalPkgs = true` and `useUserPackages = true`.

## Security Integration

1Password is used throughout for SSH key management and Git signing. The 1Password SSH agent handles key access - no manual key management needed.

## Home-Manager Options

Reference: https://home-manager-options.extranix.com/?release=release-25.11
