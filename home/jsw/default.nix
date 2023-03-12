{ config, pkgs, hyprland, home-manager, ... }:
{
  imports = [ 
    home-manager.nixosModules.home-manager 
    ./waybar/default.nix 
  ]; 

  users.users.jsw = {
    isNormalUser = true;
    home = "/home/jsw/";
    description = "Jurn Wubben";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  home-manager.users.jsw = {
    home.username = "jsw";
    home.homeDirectory = "/home/jsw/";
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [ 
      glxinfo
      nodejs
      nodePackages.pnpm
      bat
      calc
      remarkable-mouse

      obs-studio
      rustdesk
      discord
    ];
    nixpkgs.overlays = [
      (self: super: {
        discord = super.discord.override { withOpenASAR = true; };
      })
    ];

    services.udiskie.enable = true;

    imports = [ 
      ./hyprland/default.nix 
      ./wofi/default.nix 
      ./alacritty.nix 
      ./git.nix 
      ./fish.nix 
      ./vscode.nix 
      ./theme.nix
      ./neovim.nix
      ./ssh.nix
      ./libresprite/default.nix
    ]; 
  };

}
