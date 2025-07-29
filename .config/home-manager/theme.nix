{ config, pkgs, ... }:

{

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.gyre-fonts;
        name = "TeX Gyre Adventor 10";
      };

      sizes = {
        applications = 10;
        desktop = 10;
      };
    };

    cursor.package = pkgs.rose-pine-cursor;
    cursor.name = "BreezeX-RosePine-Linux";
    cursor.size = 24;
    
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
    };

    targets.nixos-icons.enable = true;
    targets.qt = {
      enable = true;
      platform = "qtct";
    };
  };
}

