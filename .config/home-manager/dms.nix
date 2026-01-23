{inputs, pkgs, ...}: {
  programs.dank-material-shell = {
    enable = true;
    quickshell.package = inputs.quickshell.packages.x86_64-linux.default;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;
  };
}
