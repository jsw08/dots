{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libgdiplus
      ];
    };
  };
  programs.java.enable = true; 
  environment.systemPackages = with pkgs; {
    gnome3.adwaita-icon-theme
    lutris
    (steam.override { withJava = true; })
  };
}