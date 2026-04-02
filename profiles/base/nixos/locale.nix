{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.profiles.base;
in {
  config = mkIf cfg.enable {
    time.timeZone = cfg.locale.timezone;
    i18n.defaultLocale = cfg.locale.defaultLocale;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = cfg.locale.defaultLocale;
      LC_IDENTIFICATION = cfg.locale.defaultLocale;
      LC_MEASUREMENT = cfg.locale.defaultLocale;
      LC_MONETARY = cfg.locale.defaultLocale;
      LC_NAME = cfg.locale.defaultLocale;
      LC_NUMERIC = cfg.locale.defaultLocale;
      LC_PAPER = cfg.locale.defaultLocale;
      LC_TELEPHONE = cfg.locale.defaultLocale;
      LC_TIME = cfg.locale.defaultLocale;
    };
  };
}
