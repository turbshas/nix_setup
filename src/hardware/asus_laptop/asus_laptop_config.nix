{ config, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.extraModulePackages = [
        # Add support for USB WiFi dongle
        config.boot.kernelPackages.rtl88x2bu
        # ADd nvidia X11 support
        config.boot.kernelPackages.nvidia_x11
    ];

    # Configure nvidia driver with switching enabled for Intel integrated GPU
    hardware.nvidia = {
        # See https://nixos.wiki/wiki/nvidia
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package =  config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
            sync.enable = true;
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
    };
    boot.initrd.kernelModules = [ "nvidia" ];

    # Load nvidia driver for xorg and wayland
    services.xserver.videoDrivers = [ "nvidia" ];
}
