{ config, pkgs, ... }:
{
  security.polkit.enable = true;
  environment.systemPackages = [ pkgs.libsForQt5.polkit-kde-agent ];
  environment.etc."polkit-kde-agent/agent".source = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
}
