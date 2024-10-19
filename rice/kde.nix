{ pkgs, ... }: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    # krdp # TODO
  ];

  home-manager.sharedModules = [{
    home.packages = with pkgs; [
      ffmpeg
      gimp
      k3b
      kcalc
      kdenlive
      libnotify
      obs-studio
      onlyoffice-bin_latest
      rustdesk-flutter
      skanlite
      vlc

      clinfo
      glxinfo
      libva-utils
      vulkan-tools
      wayland-utils
    ];
  }];

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;

    xserver.xkb.layout = "de";
  };
}
