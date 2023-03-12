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
      pull="git pull";
      push="git push origin";
      rmouse="remouse --key ~/.ssh/id_rsa  --monitor 1 --orientation left --evdev --mode stretch";
      cat="bat";
    };
    interactiveShellInit = "set fish_greeting ''; pfetch";
  };	
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
