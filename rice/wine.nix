{ pkgs, ... }: {
  hardware.opengl = {
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      intel-media-driver
      intel-vaapi-driver
    ];
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
