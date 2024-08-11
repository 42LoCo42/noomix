{ lib, ... }:
let
  inherit (lib) mkDefault mkOption;
  inherit (lib.types) anything functionTo;
in
{
  options.noomix.defaultDisk = mkOption {
    type = functionTo anything;
    default = fs: [
      fs.defaultBoot
      {
        content = fs.luks {
          content = fs.btrfs {
            subvols = {
              home.mountpoint = "/home";
              home-snap.mountpoint = "/home/.snapshots";

              nix.mountpoint = "/nix";

              persist.mountpoint = "/persist";
              persist-snap.mountpoint = "/persist/.snapshots";
            };
          };
        };
      }
    ];
  };

  config.aquaris.persist = {
    enable = mkDefault true;
    dirs = [
      "/var/lib/cups"
      "/var/lib/upower"
    ];
  };
}
