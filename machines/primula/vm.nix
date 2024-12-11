{ pkgs, ... }: {
  home-manager.sharedModules = [{
    home.packages = with pkgs; [
      virt-manager
    ];
  }];

  networking.firewall.trustedInterfaces = [ "virbr0" ];

  services = {
    samba = {
      enable = true;
      nsswins = true;
      openFirewall = true;

      settings = {
        global = {
          "client min protocol" = "NT1";
          "guest account" = "nobody";
          "hosts allow" = "0.0.0.0/0";
          "map to guest" = "bad user";
          "netbios name" = "primula";
          "security" = "user";
          "server min protocol" = "NT1";
          "server string" = "primula";
          "workgroup" = "WORKGROUP";
        };

        vhs = {
          "browseable" = "yes";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force group" = "users";
          "force user" = "jana";
          "guest ok" = "yes";
          "path" = "/home/jana/VHS";
          "read only" = "no";
        };
      };
    };

    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };

  users.users.jana.extraGroups = [ "libvirtd" ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
  };
}
