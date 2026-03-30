{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio
    android-studio-tools
    android-tools
  ];
}