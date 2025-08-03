{ pkgs, config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine.id = "b1aedb4da0644dac4fc34fce66af41e3";
    secrets.pub = "HtAU3cwsCcJMU9ZebrWO4763ZrphnKOmOkEyPZQ4ACo";

    users.mario = {
      admin = true;
      description = "Mario Voigt";
    };

    filesystems = { fs, ... }: {
      disks."/dev/disk/by-id/wwn-0x500a0751e89a8fd9".partitions =
        config.noomix.defaultDisk fs;
    };
  };

  home-manager.sharedModules = [{
    home.packages = with pkgs; [ thunderbird ];
  }];
}
