{ config, pkgs, inputs,... }:
{
  home.packages = with pkgs; [ 
    glxinfo
    nodejs
    nodePackages.pnpm
    calc
    bat
    remarkable-mouse

    obs-studio
    rustdesk
    inputs.webcord.packages.${pkgs.system}.default
  ];
}
