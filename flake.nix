{
  inputs = {
    aquaris.url = "github:42loco42/aquaris";
    aquaris.inputs.home-manager.follows = "home-manager";
    aquaris.inputs.nixpkgs.follows = "nixpkgs";
    aquaris.inputs.obscura.follows = "obscura";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-fresh.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/nur";
    nur.inputs.nixpkgs.follows = "nixpkgs";

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
        all = pipe self.nixosConfigurations [
          builtins.attrValues
          (map (x: x.config.system.build.toplevel))
          (pkgs.linkFarmFromDrvs "all")
        ];
      }
    )
  ];
}
