{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      nerdfonts = prev.nerdfonts.override {
        fonts = [ "Iosevka" ];
      };
    })
  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      nerdfonts
    ];

    fontconfig.defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "IosevkaNerdFont" ];
    };
  };
}
