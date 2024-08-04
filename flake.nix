{
  inputs = {
    aquaris.url = "github:42loco42/aquaris/rewrite";
    aquaris.inputs.home-manager.follows = "home-manager";
    aquaris.inputs.nixpkgs.follows = "nixpkgs";
    aquaris.inputs.obscura.follows = "obscura";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/nur";

    obscura.url = "github:42loco42/obscura";
  };

  outputs = { aquaris, self, ... }: aquaris.lib.merge [
    (aquaris self { })
    (
      let
        system = "x86_64-linux";
        pkgs = import self.inputs.nixpkgs { inherit system; };
        inherit (pkgs.lib) pipe;
      in
      {
        build = pipe self.nixosConfigurations [
          builtins.attrValues
          (map (x: x.config.system.build.toplevel))
          (pkgs.linkFarmFromDrvs "all")
          (x: pkgs.writeShellApplication {
            name = "build";
            runtimeInputs = with pkgs; [ attic-client ];
            text = ''
              attic login eleonora https://attic.eleonora.gay "$ATTIC_TOKEN"
              attic push default ${x}
            '';
          })
        ];
      }
    )
  ];
}
