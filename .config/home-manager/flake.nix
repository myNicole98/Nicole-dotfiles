{
  description = "Home Manager configuration of nicole";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-monitor = {
      url = "github:antonjah/nix-monitor";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, stylix, dankMaterialShell, niri, dgop, quickshell, nix-monitor, zen-browser, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."nicole" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ 
        stylix.homeModules.stylix
        dankMaterialShell.homeModules.dank-material-shell
        niri.homeModules.niri
        nix-monitor.homeManagerModules.default
        {
          programs.nix-monitor = {
            enable = true;
            
            # Required: customize for your setup
            rebuildCommand = [ 
              "bash" "-c" 
              "sudo nixos-rebuild switch"
            ];
            generationsCommand = [ "sh" "-c" "nix-env --list-generations --profile /nix/var/nix/profiles/system | wc -l" ];
          };
        }

        ./home.nix 
        ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
}
