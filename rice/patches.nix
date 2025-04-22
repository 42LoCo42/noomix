{ self, pkgs, ... }:
let
  pkgs-fresh = import self.inputs.nixpkgs-fresh {
    inherit (pkgs) system;
  };
in
{
  nixpkgs.overlays = [
    (_:_: {
      # jujutsu in our default input (nixos-24.11) is version 0.23.0
      # which is marked as insecure (GHSA-794x-2rpg-rfgr)
      inherit (pkgs-fresh) jujutsu;
    })
  ];
}
