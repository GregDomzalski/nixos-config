{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  programs.zsh.enable = true;

  users.users.greg = {
    isNormalUser = true;
    description = "Greg Domzalski";
    initialHashedPassword = "$y$j9T$frE8qq.p9I5oqqVA2oULG.$4Oxo/d3wVEdww81tfGJ2es6ltLuBDlYcjMCO3MYrn95";
    
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPwggmjUJ39tlgLhIMECu0ExVlco2/HqIx9d6gE1E5zf greg@gregdom.com"
    ];

    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "dialout"
      "qemu-libvirtd"
      ];

    shell = pkgs.zsh;
  };
}