{ modulesPath, ... }: {
    imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    #### KERNEL ####
    boot.initrd.availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "vmd"
        "nvme"
        "usb_storage"
        "sd_mod"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [];

    #### FILE SYSTEM ####
    fileSystems."/" = {
        label = "nixos";
        fsType = "ext4";
    };
    fileSystems."/boot" = {
        label = "ESP";
        fsType = "vfat";
    };
    fileSystems."/media/data" = {
        label = "data";
        fsType = "ext4";
        options = [ "nofail" ];
    };
    swapDevices = [
        { label = "swap"; }
    ];

    #### GENERAL SETTINGS ####
    hardware.cpu.intel.updateMicrocode = true;
    system.stateVersion = "24.05";
}
