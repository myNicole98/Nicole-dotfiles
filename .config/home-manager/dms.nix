{inputs, ...}: {
  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = inputs.quickshell.packages.x86_64-linux.default;
  };
}
