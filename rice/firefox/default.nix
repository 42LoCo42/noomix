{ self, pkgs, ... }: {
  imports = [ self.inputs.nur.modules.nixos.default ];

  nixpkgs.config.firefox.speechSynthesisSupport = false;

  home-manager.sharedModules = [{
    programs.firefox = {
      enable = true;
      profiles.default = {
        settings = import ./prefs.nix;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          canvasblocker
          istilldontcareaboutcookies
          localcdn
          sponsorblock
          ublock-origin
        ];
      };
    };
  }];
}
