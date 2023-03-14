{
  nixpkgs,
  self,
  ...
}: let
  inputs = self.inputs;
  bootloader = ../modules/core/bootloader.nix;
  core = ../modules/core/default.nix;
  nvidia = ../modules/graphics/nvidia.nix;
  intel = ../modules/graphics/intel.nix;
  wayland = ../modules/wayland/default.nix;
  jsw = ../modules/jsw_home/default.nix;
  hw = inputs.nixos-hardware.nixosModules;
  hmModule = inputs.home-manager.nixosModules.home-manager;

  shared = [ core wayland hmModule ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
  };
in {
  jsw-pc = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "jsw-pc";}
        {inherit home-manager;}
        ./jsw-pc/hardware-configuration.nix
        nvidia
        intel
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };
}
