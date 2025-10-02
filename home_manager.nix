{ config, pkgs, ... }:
{
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-backup";
    };

    # home-manager.users.emily = { pkgs, ... }: {
    #     home.packages = [ ];
    #     programs.bash.enable = true;
    #     isNormalUser = true;
      
    #     # The state version is required and should stay at the version you
    #     # originally installed.
    #     home.stateVersion = "24.11";
    #     programs.home-manager.enable = true;
    # };

    # xsession.enable = true;
    # xsession.windowManager.command = "…";
}
