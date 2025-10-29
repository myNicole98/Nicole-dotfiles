{ config, pkgs, inputs, ... }:

{
    imports = [
    ./theme.nix
    ./dms.nix
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
  ];
  
  programs.home-manager.enable = true;
  #programs.dankMaterialShell = {
  #enable = true;
  #quickshell.package = inputs.quickshell.packages.x86_64-linux.default;
  #};
}
