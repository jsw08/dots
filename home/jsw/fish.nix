{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      addup="git add -u";
      add="git add .";
      branch="git branch";
      checkout="git checkout";
      clone="git clone";
      commit="git commit -m";
      pull="git fetch";
      push="git push origin";
    };
    interactiveShellInit = "set fish_greeting ""; pfetch";
  };	
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

}
