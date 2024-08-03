{ pkgs, ... }: {
  hardware.graphics = {
    enable32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
    extraPackages32 = with pkgs.driversi686Linux; [ amdvlk ];
  };

  home-manager.sharedModules = [{
    home.packages = with pkgs; [
      wineWowPackages.staging
      winetricks
    ];
  }];
}
