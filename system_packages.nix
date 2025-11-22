{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        vim
        wget
        zsh
        silver-searcher
        screen
        openssh
        python314
        # Used for zsh theming, but theoretically could be used elsewhere.
        powerline-fonts
        # Used for zsh plugins. Might as well install globally.
        python313Packages.pygments
        wmctrl
        xdotool
    ];
}
