{ config, pkgs, ... }: 
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
     host rem
        Hostname 10.11.99.1
        User root
        Port 22
        IdentityFile ~/.ssh/id_rsa     
    '';
  };
}
