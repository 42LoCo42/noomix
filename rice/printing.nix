{ pkgs, config, ... }: {
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
    openFirewall = true;
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    printing.enable = true;
  };

  users.users = builtins.mapAttrs
    (_: _: { extraGroups = [ "lp" "scanner" ]; })
    config.aquaris.users;
}
