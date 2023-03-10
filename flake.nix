{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    arion.url = "github:hercules-ci/arion";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, arion, ... }@attrs: {
    nixosConfigurations.jsw-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./hosts/jsw-pc/default.nix ];
    };
    nixosConfigurations.jsw-server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = attrs;
      modules = [ ./hosts/jsw-pc/default.nix ];
    };
  };
}
