{ modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];

  networking.interfaces.wlp1s0.useDHCP = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
}
