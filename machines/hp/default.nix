{ aquaris, config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine = {
      id = "b1aedb4da0644dac4fc34fce66af41e3";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINI5SfKBIes/JSsGVJKiTt2IYfTmjdgp7ZzTdeHmERL7";
    };

    users.mario = {
      admin = true;
      description = "Mario Voigt";
    };

    filesystems = { fs, ... }: {
      disks."/dev/disk/by-id/TODO".partitions =
        config.noomix.defaultDisk fs;
    };
  };

  # TODO move to hardware.nix
  nixpkgs.hostPlatform = "x86_64-linux";
}
