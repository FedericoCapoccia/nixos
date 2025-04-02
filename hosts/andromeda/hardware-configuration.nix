{ config, lib, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd = {
    availableKernelModules =
      [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    supportedFilesystems = [ "btrfs" ];
    kernelModules = [ ];
    verbose = false;
    systemd.enable = true;
  };

  boot = {
    kernelModules = [ "kvm-amd" ];
    kernelParams = [ "quiet" "splash" "udev.log_level=3" "amd_pstate=passive" ];
    extraModulePackages = [ ];
    consoleLogLevel = 0;
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };

    systemd-boot = {
      enable = true;
      configurationLimit = 5;
      consoleMode = "max";
    };
  };



  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos-root";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS_BOOT";
    fsType = "vfat";
    options = [
      "fmask=0077" "dmask=0077" 
    ];
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
