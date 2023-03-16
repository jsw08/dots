{ config, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --remember --cmd Hyprland ";
      };
      initial_session = {
        command = "Hyprland";
        user = "jsw";
      };
    };
  }; 
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
}
