{ inputs, pkgs, ... }:
let 
    spaceshipPrompt = builtins.fetchGit {
        url = "https://github.com/denysdovhan/spaceship-prompt.git";
        ref = "master";
        rev = "0acfcd2513025ee33a4ae071df163503ff112b11";
    };
    aliasTips = builtins.fetchGit {
        url = "https://github.com/djui/alias-tips.git";
        rev = "41cb143ccc3b8cc444bf20257276cb43275f65c4";
        ref = "master";
    };
    zshAutosuggest = builtins.fetchGit {
        url = "https://github.com/zsh-users/zsh-autosuggestions";
        rev = "85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5";
        ref = "master";
    };
    zshNotify = builtins.fetchGit {
        url =  "https://github.com/marzocchi/zsh-notify.git";
        rev = "9c1dac81a48ec85d742ebf236172b4d92aab2f3f";
        ref = "master";
    };
in 
{
    home = {
        username = "emily";
        homeDirectory = "/home/emily";
        stateVersion = "24.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    };

    home.packages = with pkgs; [
        oh-my-zsh

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
            # TODO: setup vim automatically
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

        # Zsh/Oh My Zsh customizations.
        ".oh-my-zsh" = {
            source = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
            recursive = true;
        };
        # Themes
        ".oh-my-zsh/custom/themes/spaceship.zsh-theme" = { source = "${spaceshipPrompt}/spaceship.zsh-theme"; };
        ".oh-my-zsh/custom/plugins/alias-tips" = { source = "${aliasTips}"; };
        ".oh-my-zsh/custom/plugins/zsh-autosuggestions" = { source = "${zshAutosuggest}"; };
        ".oh-my-zsh/custom/plugins/notify" = { source = "${zshNotify}"; };
    };

    home.sessionVariables = { };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
    };

    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            theme = "robbyrussell";
        };
    };
    programs.git = {
        enable = true;
        userEmail = "emilyurbshas@gmail.com";
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
