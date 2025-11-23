{ config, pkgs, ... }:
{
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-backup";
    };

    # xsession.enable = true;
    # xsession.windowManager.command = "…";
}
