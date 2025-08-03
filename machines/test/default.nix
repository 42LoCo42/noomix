{ config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine.id = "93e8c40cd2d42f5d4743af3c66b5a193";
    secrets.pub = "7gNA5SK5s_sNWCmHeivn4hgu0bR12mRXT_Yf5S6lRns";

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
