{ inputs, pkgs, ... }:
{
    home = {
        username = "emily";
        homeDirectory = "/home/emily";
        stateVersion = "24.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    };

    home.packages = with pkgs; [
        # (pkgs.callPackage ./runpod { })
        # shell config
        starship # prompt

        vscode
        github-desktop
        devenv

        # debuggers
        lldb
        gdb
        valgrind

        # RDP client
        remmina
        # For connecting to cisco VPN
        openconnect
        # For configuring VPNs in GUI
        openvpn
        networkmanagerapplet
        networkmanager-openvpn
        # The gameler
        steam
    ];

    home.file = {
        ".zshrc" = {
            source = ./zshrc;
            target = ".zshrc";
        };
        ".vimrc" = {
            source = ./vimrc;
            target = ".vimrc";
            # Open vim once to install Plug, then open vim again to install all plugins.
            # onChange = "vim +qall\nvim '+PlugInstall --sync' +qall";
        };
        ".vim/colors/badwolf.vim" = {
            source = ./badwolf.vim;
        };
        ".vim/plugins/cscops_maps.vim" = {
            source = ./cscope_maps.vim;
        };
        ".vim/ftplugin/make.vim" = {
            text = "setlocal noexpandtab";
        };
    };

    home.sessionVariables = { };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    programs.zsh = {
        enable = true;
    };
    programs.git = {
        enable = true;
        userEmail = "turbshas@gmail.com";
        userName = "Emily Urbshas";
        extraConfig = {
            pull.rebase = true;
            rebase.autoStash = true;
            diff.tool = "default-difftool";
            push.autoSetupRemote = true;
        };
        lfs.enable = true;
        delta.enable = true;
    };

    # services.vscode-server.enable = true;
}
