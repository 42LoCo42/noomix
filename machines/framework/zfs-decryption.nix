{ pkgs, lib, ... }: {
  boot.initrd.systemd = {
    initrdBin = with pkgs; [ clevis jose tpm2-tools ];
    services.zfs-import-rpool.script = lib.mkForce ''
      zpool status rpool || zpool import -f rpool
      clevis decrypt < /sysroot/boot/zfs-primary.key | zfs load-key rpool
    '';
  };

  fileSystems."/boot".neededForBoot = true;
}
