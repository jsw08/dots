{
  description = "Jsw's nixos conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    webcord.url = "github:fufexan/webcord-flake";
    hyprland.url = "github:hyprwm/Hyprland/";
    hyprland-contrib.url = "github:hyprwm/contrib";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.jsw-pc = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [ 
        { networking.hostName = "jsw-pc"; }
        ./hosts/jsw-pc/hardware-configuration.nix
        ./modules/core/default.nix
        ./modules/graphics/nvidia.nix
        ./modules/graphics/intel.nix
        ./modules/wayland/default.nix
        ./modules/jsw_home/default.nix
      ];
    };
  };
}
