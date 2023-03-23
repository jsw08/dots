{
  nixpkgs,
  self,
  lib,
  ...
}: let
  inputs = self.inputs;

  core = ../modules/core; 
  desktop = ../modules/desktop;
  system = ../modules/system; 
  home = ../home; 

  home-manager = inputs.home-manager.nixosModules.home-manager;
  shared = [ system core home ];
in {
  jsw-pc = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "jsw-pc";}
        ./jsw-pc
        desktop
        home-manager
      ]
      ++ shared;
    specialArgs = {inherit inputs self lib;};
  };
}
