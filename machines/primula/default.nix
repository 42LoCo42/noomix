{ config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine = {
      id = "a42a6dc5adc0b668d241fdfd66ae3c38";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBy/Ki0FW7mFs5BllgGmSMIMzu5O4UOaarwHQYWtQepe";
    };

    users.jana = {
      admin = true;
      description = "Jana Schumacher";
    };

    persist.enable = false;
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8821au ];
  programs.gamemode.enable = true;
}
