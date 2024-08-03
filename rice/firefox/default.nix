{ self, config, ... }: {
  imports = [ self.inputs.nur.nixosModules.nur ];

  nixpkgs.config.firefox.speechSynthesisSupport = false;

  home-manager.sharedModules = [{
    programs.firefox = {
      enable = true;
      profiles.default = {
        settings = import ./prefs.nix;

        extensions = with config.nur.repos.rycee.firefox-addons; [
          canvasblocker
          istilldontcareaboutcookies
          localcdn
          sponsorblock
          ublock-origin
        ];

        # TODO figure this stuff out
        # search = {
        #   force = true;
        #   default = "SearXNG";
        #   engines = {
        #     "SearXNG" = {
        #       iconUpdateURL = "https://searx.eleonora.gay/favicon.ico";
        #       urls = [{
        #         template = "https://searx.eleonora.gay/search";
        #         method = "POST";
        #         params = [{
        #           name = "q";
        #           value = "{searchTerms}";
        #         }];
        #       }];
        #     };

        #     "MyNixOS" = {
        #       iconUpdateURL = "https://mynixos.com/favicon.ico";
        #       urls = [{
        #         template = "https://mynixos.com/search?q={searchTerms}";
        #       }];
        #       definedAliases = [ "!n" ];
        #     };
        #   };
        # };
      };
    };
  }];
}
