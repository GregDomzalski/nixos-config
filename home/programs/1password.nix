{ pkgs, ... }:
{
  xdg.autostart = {
    enable = true;
    entries = [
      "${pkgs._1password-gui}/share/applications/1password.desktop"
    ];
  };
}
