{ config, pkgs, ... }:
{
  programs.gh = {
    enable = true;
  };
  programs.git = {
    enable = true;
    aliases = {
      "." = "add .";
    };
    userName = "Jurn Wubben";
    userEmail = "jurnwubben@gmail.com";
  };
}
