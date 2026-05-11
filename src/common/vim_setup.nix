{ config, pkgs, lib, ... }:
{
    # environment.variables = { EDITOR = "vim"; };

    # environment.systemPackages = with pkgs; [
    #     ((vim_configurable.override {  }).customize{
    #         name = "vim";

    #         # Install plugins for example for syntax highlighting of nix files
    #         vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
    #             start = [ vim-nix vim-lastplace ];
    #             opt = [];
    #         };

    #         vimrcConfig.customRC = ''
    #             " your custom vimrc
    #             set nocompatible
    #             set backspace=indent,eol,start
    #             " Turn on syntax highlighting by default
    #             syntax on
    #             " ...
    #         '';
    #     }
    # )
    # ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        withNodeJs = true;
        withPython3 = true;
        withRuby = true;

        plugins = [
            pkgs.vimPlugins.nvim-dap
            pkgs.vimPlugins.nvim-dap-ui
            pkgs.vimPlugins.telescope-nvim
            pkgs.vimPlugins.neo-tree-nvim
            pkgs.vimPlugins.nvim-web-devicons
            pkgs.vimPlugins.nvim-lsp-file-operations
            pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        ];
    };
}
