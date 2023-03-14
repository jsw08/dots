{ config, pkgs, ... }:
{
  home.file.".config/fish/themes/Catppuccin Frappe.theme".source = ./Catppuccin_Frappe.theme;
  home.file.".config/fish/fish_variables".source = ./fish_variables;
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
    interactiveShellInit = ''
      # TokyoNight Color Palette
      set -l foreground c0caf5
      set -l selection 364a82
      set -l comment 565f89
      set -l red f7768e
      set -l orange ff9e64
      set -l yellow e0af68
      set -l green 9ece6a
      set -l purple 9d7cd8
      set -l cyan 7dcfff
      set -l pink bb9af7

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $cyan
      set -g fish_color_keyword $pink
      set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $purple
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink
      set -g fish_color_autosuggestion $comment

      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment
      set -g fish_pager_color_selected_background --background=$selection

      set fish_greeting "" 
      pfetch
    '';
  };	
  programs.starship = 
  let
    flavour = "frappe";
  in {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = "$all";
      palette = "catppuccin_${flavour}";
    } // builtins.fromTOML (builtins.readFile
      (pkgs.fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "starship";
          rev = "3e3e54410c3189053f4da7a7043261361a1ed1bc";
          sha256 = "b28101565ab750b7a264501d41831116eb30208848f5b725214f165e3c5dee86";
        } + /palettes/${flavour}.toml));
  };
}
