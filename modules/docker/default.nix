{ config, pkgs, arion, ... }: {
  imports = [ arion.nixosModules.arion ];
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "jsw" ];

  virtualisation.arion = {
    backend = "docker";
    projects.selfhosted.settings = {
      services.nextcloud_db.service = {
        image = "mariadb:10.5";
        restart = "always";
        command = "--transaction-isolation=READ-COMMITTED --log-bin=binlog --binlog-format=ROW";
        volumes = [
          "/nextcloud/db:/var/lib/mysql"
        ];
        environment = {
          MYSQL_ROOT_PASSWORD="rR^cG@8PEFvgSC";
          MYSQL_PASSWORD="Q6TLw^8ha5ngGe";
          MYSQL_DATABASE="nextcloud";
          MYSQL_USER="nextcloud";
        };
      };
      services.nextcloud.service = {  
        image = "nextcloud";
        restart = "always";
        ports = [
          "8080:80"
        ];
        links = [
          "nextcloud_db"
        ];
        volumes = [
          "/nextcloud/html:/var/www/html"        
        ];
        environment = {
          MYSQL_PASSWORD="Q6TLw^8ha5ngGe";
          MYSQL_DATABASE="nextcloud";
          MYSQL_USER="nextcloud";
          MYSQL_HOST="db";
        };
      };    
      services.swag.service = {
        image = "lscr.io/linuxserver/swag";
        restart = "unless-stopped";
        ports = [
          "80:80"
          "443:443"
        ];
        environment = {
          PUID=1000;
          PGID=1000;
          TZ="Europe/Amsterdam";
          URL="jswservers.duckdns.org";
          SUBDOMAINS="www,";
          EMAIL="jurnwubben@gmail.com";
          VALIDATION="duckdns";
          DUCKDNSTOKEN="9cc2a5d7-ca6b-445a-a365-6959d815df52"
        };
        volumes = [
          "/swag/config:/config"
        ];
      };
    };
  };
}
