{ config, pkgs, inputs, ... }:

{
    imports = [
    ./theme.nix
    ./firefox.nix
    ./dms.nix
    inputs.zen-browser.homeModules.beta
  ];

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };

  home.username = "nicole";
  home.homeDirectory = "/home/nicole";
  home.stateVersion = "25.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    kdePackages.qt5compat
  ];
  
  programs.home-manager.enable = true;

  programs.zen-browser = {
    enable = false;
    #setAsDefaultBrowser = true;
  };

  services.linux-wallpaperengine = {
    enable = false;
    assetsPath = "/mnt/storage/SteamLibrary/steamapps/common/wallpaper_engine/assets";
  };
  #programs.dankMaterialShell = {
  #enable = true;
  #quickshell.package = inputs.quickshell.packages.x86_64-linux.default;
  #};
}
