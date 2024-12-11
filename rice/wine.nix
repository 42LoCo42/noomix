{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
      intel-media-driver
      intel-vaapi-driver
    ];

    enable32Bit = true;
    extraPackages32 = with pkgs.driversi686Linux; [
      amdvlk
      intel-media-driver
      intel-vaapi-driver
    ];
  };

  home-manager.sharedModules = [{
    home.packages = with pkgs; [
      wineWowPackages.staging
      winetricks
    ];
  }];
}
