{ lib, config, ... }: {
  imports = [ ../../rice ];

  aquaris = {
    machine.id = "14b0904d2de141a985b3dd29196cd1f5";
    secrets.pub = "ZG939aikclsft1nO6lpss7oUo4LHxameELu01C3VT0c";

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
      "browser.startup.page" = lib.mkForce 1; # firefox home page
      "signon.autofillForms" = lib.mkForce true;
      "signon.generation.enabled" = lib.mkForce true;
      "signon.rememberSignons" = lib.mkForce true;
    };

    services.syncthing.enable = true;
  }];
}
