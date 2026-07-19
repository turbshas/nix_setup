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
        # Used for zsh plugins. Might as well install globally.
        python313Packages.pygments
        wmctrl
        xdotool
        usbutils
        killall
        libnotify # for notify-send (for zsh-notify)
        samba # for windows VM
        quickemu # for windows VM
    ];

    fonts.packages = with pkgs; [
        # Used for zsh and neovim theming, but theoretically could be used elsewhere.
        # nerd-fonts.symbols-only
        powerline-fonts
        powerline-symbols
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
