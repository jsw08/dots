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
  };	
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

}
