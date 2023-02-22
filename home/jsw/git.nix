{ config, pkgs, ... }:
{
  programs.gh = {
    enable = true;
  };
  programs.git = {
    enable = true;
    userName = "Jurn Wubben";
    userEmail = "jurnwubben@gmail.com";
  };
}
