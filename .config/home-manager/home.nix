{ config, pkgs, ... }:

{
    imports = [
    ./theme.nix
  ];

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

  home.username = "nicole";
  home.homeDirectory = "/home/nicole";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = [
  ];
  
  programs.home-manager.enable = true;
  
  #gtk = {
  #  enable = true;
    #iconTheme = {
    #  name = "Papirus-Dark";
    #  package = pkgs.papirus-icon-theme;
    #};
  #};

  #qt = {
  #  enable = true;
  #};
 
  /*   
  gtk = {
      enable = true;
      font.name = "TeX Gyre Adventor 10";

      theme = {
        name = "rose-pine-moon";
	       package = pkgs.rose-pine-gtk-theme;
     };
     cursorTheme = {
        name = "rose-pine-cursor";
	      package = pkgs.rose-pine-cursor;
       size = 24;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };



      gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

      gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
   
  dconf = {
    settings = {
        "org/cinnamon/desktop/applications/terminal" = {
            exec = "kitty";
        };
       "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
        };
    };
  };


  xdg.desktopEntries.nemo = {
    name = "Nemo";
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };
  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
          "inode/directory" = [ "nemo.desktop" ];
          "application/x-gnome-saved-search" = [ "nemo.desktop" ];
      };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
  */

}
