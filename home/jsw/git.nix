{ config, pkgs, ... }:
{
  programs.gh = {
    enable = true;
    settings.editor = "code";
  };
  programs.git = {
    enable = true;
    userName = "Jurn Wubben";
    userEmail = "jurnwubben@gmail.com";
  };
}
