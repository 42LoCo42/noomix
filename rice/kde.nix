{ pkgs, ... }: {
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    # krdp # TODO
  ];

  home-manager.sharedModules = [{
    home.packages = (with pkgs; [
      ffmpeg
      gimp
      libnotify
      obs-studio
      onlyoffice-bin_latest
      rustdesk-flutter
      vlc

      clinfo
      glxinfo
      libva-utils
      vulkan-tools
      wayland-utils
    ]) ++ (with pkgs.kdePackages; [
      k3b
      kcalc
      kdenlive
      skanlite
    ]);
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
