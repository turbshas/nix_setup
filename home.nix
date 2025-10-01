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
            onChange = "vim +qall\nvim '+PlugInstall --sync' +qall";
        };
    };

    home.sessionVariables = { };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    programs.zsh = {
        enable = true;
        shellAliases = {
            netcopy = ''nc -q 0 tcp.st 7777 | grep URL | cut -d " " -f 2 | pbcopy'';
            reload-fish = "exec fish";
            gcp = "git cherry-pick";
            gs = "git status";
            gp = "git pull";
            gc = "git commit -m";
            gca = "git commit --amend";
            gl = "git log";
            gf = "git fetch -p";
            ls = "eza";
            lg = "lazygit";
            ld = "lazydocker";
            gcm = "git checkout master";
            gco = "git checkout";
            p = "pnpm";
            # open a link on the connected android phone
            phone = "adb shell am start --user 0 -a android.intent.action.VIEW -d";
        };

        shellInit = ''
            starship init fish | source

            set -gx ANDROID_HOME $HOME/Android/Sdk
            set -gx PATH $PATH ~/.yarn/bin ~/.npm/bin ~/bin ~/go/bin ~/.cargo/bin $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools

            function checkout-last-version
                set card $argv[1]
                git checkout (git rev-list -n 1 HEAD -- "$card")^ -- "$card"
            end

            set -gx SW_API_HOST "https://local-skyweaver-api.0xhorizon.net"
            set -gx SW_AUTH_TOKEN "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50IjoiMHgyMDM3MTI0NzMwZjRkMmQ1MTI0OGQyYzA1ZDJhZTVjYmQyODhlZDY3IiwiYXBwIjoiU2t5d2VhdmVyIiwiZXhwIjoxNjU1ODM2Nzg4LCJpYXQiOjE2MjQzMDA3ODgsIm9nbiI6Imh0dHBzOi8vbG9jYWwuMHhob3Jpem9uLm5ldCJ9.rFCF1PhcAEJbUdMB4LFd4L6ElqA8rtxMi46gK8fQBB"
        '';
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

    services.vscode-server.enable = true;
}
