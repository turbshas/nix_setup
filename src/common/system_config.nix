{ config, pkgs, lib, ... }:
{
    nix.gc.automatic = true;
    nix.gc.persistent = true;
    nix.gc.options = "--delete-older-than 7d";

    services.automatic-timezoned.enable = true;
    services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";

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

    # Enable OpenGL
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}
