{ config, pkgs, inputs, ... }: 
{
  imports = [ inputs.hyprland.nixosModules.default ./fonts.nix ./variables.nix ];

  # Display manager
  services.xserver = {
    enable = true; # Replace this piece of shit with greet
    displayManager = {
      lightdm = {
        enable = true;  
        #settings = {
        #  General = {
        #    DisplayServer = "wayland";
        #  };
        #};
      };
    };
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
  };
  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Wayland tools
  environment.systemPackages = with pkgs; [ 
    wlr-randr
    wl-clipboard 
    swaybg 
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    wev
   ];
}
