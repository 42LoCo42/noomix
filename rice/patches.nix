{ self, pkgs, ... }:
let
  pkgs-fresh = import self.inputs.nixpkgs-fresh {
    inherit (pkgs) system;
  };
in
{
  nixpkgs.overlays = [
    (_: _: {
      # empty! :3
    })
  ];
}
