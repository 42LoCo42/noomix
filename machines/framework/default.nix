{ aquaris, config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine = {
      id = "01ae0ac7108341b791f5bdad11c773a2";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGS1Z/POPvjauxlpVzJ9WQFqXFdYOffkN3gAvc6XxymX";
    };

    users.andrea = {
      admin = true;
      description = "Andrea Boelen";
    };

    filesystems = { fs, ... }: {
      disks."/dev/disk/by-id/nvme-WD_BLACK_SN770_1TB_232857804955_1".partitions =
        config.noomix.defaultDisk fs;
    };
  };

  boot.initrd.systemd.emergencyAccess =
    "$y$j9T$jbAGAMu/YMLdXTHND5Ksn0$IT07lNexnBLjW.TA2agoi4SG/PIEVpxynqAtqmJ1bgB";
}
