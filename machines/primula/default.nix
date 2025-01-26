{ lib, config, ... }: {
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

  networking.firewall.allowedTCPPorts = [ 22000 ];

  home-manager.sharedModules = [{
    programs.firefox.profiles.default.settings = {
      "signon.autofillForms" = lib.mkForce true;
      "signon.generation.enabled" = lib.mkForce true;
      "signon.rememberSignons" = lib.mkForce true;
    };

    services.syncthing.enable = true;
  }];
}
