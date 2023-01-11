{
  description = "testing symlink store";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/daef14ab647c801f395bfcf82be87403c00fcba4";
  outputs = {
    self,
    nixpkgs,
  } @ args: let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.hello-bin-path = derivation {
      name = "hello-bin-path";
      builder = "${pkgs.coreutils}/bin/true";
      system = "x86_64-linux";
    };

# pkgs.writeText "hello-bin-path" ''
#       hello world bin path: ${pkgs.hello}
#     '';
  };
}
