{ config, pkgs, inputs,... }:
{
  home.packages = with pkgs; [ 
    glxinfo
    nodejs
    nodePackages.pnpm
    calc
    remarkable-mouse
    bat

    obs-studio
    rustdesk
    inputs.webcord.packages.${pkgs.system}.default
  ];
}
