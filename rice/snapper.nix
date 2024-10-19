{ pkgs, config, ... }: {
  services.snapper = {
    persistentTimer = true;
    configs =
      let
        mk = path: {
          SUBVOLUME = path;
          ALLOW_GROUPS = [ "wheel" ];
          TIMELINE_CREATE = true;
          TIMELINE_CLEANUP = true;
        };
      in
      { home = mk "/home"; } //
      (if config.aquaris.persist.enable
      then { persist = mk "/persist"; }
      else { root = mk "/"; });
  };

  home-manager.sharedModules = [{
    home.packages = with pkgs; [ snapper-gui ];
  }];
}
