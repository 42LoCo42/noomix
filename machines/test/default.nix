{ config, lib, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine = {
      id = "93e8c40cd2d42f5d4743af3c66b5a193";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPQcGK0WSAxXomRKVFE5g8FgjsOeiB6ke8cDt0S04rS/";
    };

    users.test = {
      admin = true;
      description = "Test User";
    };

    filesystems = { fs, ... }: {
      disks."/dev/disk/by-id/virtio-root".partitions =
        config.noomix.defaultDisk fs;
    };
  };
}
