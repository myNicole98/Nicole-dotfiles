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
}
