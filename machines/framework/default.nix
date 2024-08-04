{ aquaris, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine = {
      id = "01ae0ac7108341b791f5bdad11c773a2";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGS1Z/POPvjauxlpVzJ9WQFqXFdYOffkN3gAvc6XxymX";
    };

    users = {
      andrea = {
        admin = true;
        description = "Andrea Boelen";
      };
    };

    filesystems = { fs, ... }: {
      disks."/dev/disk/by-id/nvme-WD_BLACK_SN770_1TB_232857804955_1".partitions = [
        fs.defaultBoot
        {
          content = fs.luks {
            content = fs.zpool (p: p.rpool);
          };
        }
      ];

      zpools.rpool = aquaris.lib.merge [
        fs.defaultPool
        { datasets."nixos/home/andrea".mountpoint = "/home/andrea"; }
      ];
    };

    persist.enable = true;
  };

  boot.initrd.systemd.emergencyAccess =
    "$y$j9T$jbAGAMu/YMLdXTHND5Ksn0$IT07lNexnBLjW.TA2agoi4SG/PIEVpxynqAtqmJ1bgB";
}
