{ pkgs, config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine.id = "01ae0ac7108341b791f5bdad11c773a2";
    secrets.pub = "c6sRg2_aY94naJwhqKn6KgcVNAetMv8lg8zfAGXoQX0";

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
