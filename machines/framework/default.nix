{ pkgs, config, ... }: {
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
      disks."/dev/disk/by-id/nvme-eui.e8238fa6bf530001001b448b4a74c804".partitions =
        config.noomix.defaultDisk fs;
    };
  };

  programs.kdeconnect.enable = true;

  home-manager.sharedModules = [{
    home.packages = with pkgs; [ thunderbird ];
  }];
}
