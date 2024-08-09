{ pkgs, ... }: {
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
      {
        home = mk "/home";
        persist = mk "/persist";
      };
  };

  home-manager.sharedModules = [{
    home.packages = with pkgs; [ snapper-gui ];
  }];
}
