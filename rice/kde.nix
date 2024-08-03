{ pkgs, ... }: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  home-manager.sharedModules = [{
    home.packages = with pkgs; [
      ffmpeg
      gimp
      k3b
      kcalc
      kdenlive
      mpv
      obs-studio
      onlyoffice-bin_latest
      skanlite
      vlc

      clinfo
      glxinfo
      vulkan-tools
      wayland-utils

      # TODO required?
      # libnotify
      # xdg_utils
    ];
  }];

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;

    xserver = {
      # enable = true; # TODO required?
      xkb.layout = "de";
    };
  };
}
