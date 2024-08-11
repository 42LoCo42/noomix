{ pkgs, config, lib, ... }: {
  i18n.defaultLocale = "de_DE.UTF-8";

  # TODO required?
  networking.localCommands = "${pkgs.util-linux}/bin/rfkill unblock wifi";

  nix.gc = {
    automatic = true;
    dates = "monthly";
  };

  security.rtkit.enable = true;

  services = {
    fwupd.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    flake = "github:42loco42/noomix";
    flags = [ "--refresh" "-L" ];
    operation = "boot";
  };

  users.users = builtins.mapAttrs
    (_: _: {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJVieLCkWGImVI9c7D0Z0qRxBAKf0eaQWUfMn0uyM/Ql leonsch"
      ];
    })
    config.aquaris.users;

  home-manager.sharedModules = [{
    aquaris.persist = lib.mkForce [ ];
    home.sessionVariables."NIXOS_CONFIG_DIR" = "$HOME/.dotfiles";
  }];
}
