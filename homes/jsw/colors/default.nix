{ config, pkgs, inputs, ... }:
{
  imports = [
    nix-colors.homeManagerModule
  ];
  
  colorScheme = nix-colors.lib-core.schemeFromYAML "Catppuccin-Frappe" (builtins.readFile ./CatppuccinFrappe.yaml)
}
