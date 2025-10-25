{ config, pkgs, inputs, ... }:

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
  home.stateVersion = "25.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
      #inputs.quickshell.packages.${pkgs.system}.default
  ];
  
  programs.home-manager.enable = true;
  programs.dankMaterialShell.enable = true;
}
