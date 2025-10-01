{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        vim
        wget
        zsh
        silver-searcher
        screen
        ssh
    ];
}
