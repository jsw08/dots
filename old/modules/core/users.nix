{ config, pkgs, inputs, ... }: 
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true; 
    extraSpecialArgs = {
      inherit inputs;
    };
  };
  users.users.root.initialPassword = "changeme";
  users.groups.dotfiles.gid = 995;
    
}
