{ config, pkgs, lib, ... }:

{

  stylix = {
    enable = true;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
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

      # Papyrus Dark
      #package = pkgs.papirus-icon-theme;
      #dark = "Papirus-Dark";
      
      # Fluent
      package = pkgs.fluent-icon-theme;
      dark = "Fluent";
    };

    targets.nixos-icons.enable = true;
    targets.qt = {
      enable = true;
      platform = "qtct";
    };
  };

  #programs.kitty.themeFile = "rose-pine-moon";
  programs.kitty.themeFile = "Catppuccin-Mocha";
  programs.kitty.settings = {  
    background_opacity = lib.mkForce 0.8;
    confirm_os_window_close = 0;
    cursor_shape = "beam";
    cursor_trail = 1;
  };
  programs.kitty.enable = true;
}

