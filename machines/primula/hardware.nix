{ modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "sr_mod" "rtsx_usb_sdmmc" ];
  boot.kernelModules = [ "kvm-amd" ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/594b7186-e167-4202-a0cd-6bb99facb503";
    fsType = "btrfs";
    options = [ "subvol=root" "compress-force=zstd" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/594b7186-e167-4202-a0cd-6bb99facb503";
    fsType = "btrfs";
    options = [ "subvol=nix" "compress-force=zstd" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/594b7186-e167-4202-a0cd-6bb99facb503";
    fsType = "btrfs";
    options = [ "subvol=home" "compress-force=zstd" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1C46-4ED4";
    fsType = "vfat";
  };

  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
}
