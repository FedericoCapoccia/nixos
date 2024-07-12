{ config, lib, pkgs, modulesPath, ... }:

{
  imports =[ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd = {
    availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    supportedFilesystems = [ "btrfs" ];
    kernelModules = [ ];
  };  
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "amd_pstate=passive" ];
  boot.extraModulePackages = [ ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 5;
    };
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/5dbbdd6a-9281-40d2-9dc2-a2ef44697426";
      fsType = "btrfs";
      options = [ "subvol=root" "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" "ssd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/5dbbdd6a-9281-40d2-9dc2-a2ef44697426";
      fsType = "btrfs";
      options = [ "subvol=home" "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" "ssd" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/5dbbdd6a-9281-40d2-9dc2-a2ef44697426";
      fsType = "btrfs";
      options = [ "subvol=log" "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" "ssd" ];
    };

  fileSystems."/media/games" =
    { device = "/dev/disk/by-uuid/5dbbdd6a-9281-40d2-9dc2-a2ef44697426";
      fsType = "btrfs";
      options = [ "subvol=games" "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" "ssd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/5dbbdd6a-9281-40d2-9dc2-a2ef44697426";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" "ssd" ];
    };

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/8AE5-DE0E";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/.btrfsroot" =
    { device = "/dev/disk/by-uuid/5dbbdd6a-9281-40d2-9dc2-a2ef44697426";
      fsType = "btrfs";
      options = [ "subvolid=5" "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" "ssd" ];
    };

  fileSystems."/media/data" =
    { device = "/dev/disk/by-uuid/15b325e9-2835-4489-a0df-925e4b673ff2";
      fsType = "btrfs";
      options = [ "noatime" "compress=zstd:3" "discard=async" "space_cache=v2" ];
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
