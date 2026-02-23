{ config, pkgs, ... }:
{
    # nix.settings.experimental-features = "nix-command flakes";

    users.users.emily = {
        isNormalUser = true;
        description = "emily";
        extraGroups = [
            "networkmanager"
            "wheel"
        ];
        packages = with pkgs; [
        ];
        shell = pkgs.zsh;
    };

    programs.zsh = {
        enable = true;
        ohMyZsh = {
            enable = true;
        };
    };
    services.xserver.enable = true;

    # Enable OpenGL
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    # Configure nvidia driver
    hardware.nvidia = {
        # See https://nixos.wiki/wiki/nvidia
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package =  config.boot.kernelPackages.nvidiaPackages.stable;

        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };
            # sync.enable = true;
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
    };
    boot.initrd.kernelModules = [ "nvidia" ];
    boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

    # Load nvidia driver for xorg and wayland
    services.xserver.videoDrivers = [ "nvidia" ];
}
