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
}
