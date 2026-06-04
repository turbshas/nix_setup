{ config, pkgs, lib, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        withNodeJs = true;
        withPython3 = true;
        withRuby = true;

        plugins = [
# TODO: figure out how to initialize these plugins on neovim start

            # Styling
            pkgs.vimPlugins.nvim-web-devicons

            # File searching
            pkgs.vimPlugins.telescope-nvim
            pkgs.vimPlugins.telescope-fzf-native-nvim

            # Debugging
            pkgs.vimPlugins.nvim-dap
            pkgs.vimPlugins.nvim-dap-ui

            # LSP
            pkgs.vimPlugins.nvim-lsp-file-operations

            # File explorer
            pkgs.vimPlugins.neo-tree-nvim
            pkgs.vimPlugins.nvim-treesitter.withAllGrammars

            # Misc/idk
            pkgs.vimPlugins.plenary-nvim

            # Project management - try :Telescope projects
            pkgs.vimPlugins.project-nvim

            # Suggestion pop-up for commands/keys.
            pkgs.vimPlugins.which-key-nvim

            # Highlight word under the cursor.
            pkgs.vimPlugins.vim-illuminate

            # Adds indentation guides.
            pkgs.vimPlugins.indent-blankline-nvim

            # Completion engine while typing.
            pkgs.vimPlugins.nvim-cmp

            # nvim-cmp supporting plugins.
            pkgs.vimPlugins.cmp-nvim-lsp
            pkgs.vimPlugins.cmp-buffer
            pkgs.vimPlugins.cmp-path
            pkgs.vimPlugins.luasnip
        
            # Improved scrolling behavior.
            pkgs.vimPlugins.neoscroll-nvim

            # Improved behavior for splitting/resizing windows.
            pkgs.vimPlugins.smart-splits-nvim

            # Improved terminal mangement in-editor.
            pkgs.vimPlugins.toggleterm-nvim
        ];

        extraConfig = lib.fileContents ../assets/init.vim;
        extraLuaConfig = lib.fileContents ../assets/neovim_init.vim;
    };
}
