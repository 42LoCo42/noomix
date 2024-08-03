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

      extraConfig = ''
        workgroup = WORKGROUP
        server string = primula
        netbios name = primula
        security = user
        client min protocol = NT1
        server min protocol = NT1
        hosts allow = 0.0.0.0/0
        guest account = nobody
        map to guest = bad user
      '';

      shares.vhs = {
        path = "/home/jana/VHS";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "jana";
        "force group" = "users";
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
