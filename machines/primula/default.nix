{ config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine = {
      id = "14b0904d2de141a985b3dd29196cd1f5";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBy/Ki0FW7mFs5BllgGmSMIMzu5O4UOaarwHQYWtQepe";
    };

    users.jana = {
      admin = true;
      description = "Jana Schumacher";
    };

    persist.enable = false;
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8821au ];
}
