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

        plugins = with pkgs.vimPlugins; [
            # Themes.
            catppuccin-nvim
            tokyonight-nvim
            tokyodark-nvim
            dracula-nvim

            # Styling
            nvim-web-devicons

            # Editor tab bar.
            barbar-nvim
            gitsigns-nvim # Tab bar git integration.

            # Editor breadcrumbs.
            dropbar-nvim

            # Editor status line.
            staline-nvim

            # File searching
            telescope-nvim
            telescope-fzf-native-nvim

            # Debugging
            nvim-dap
            nvim-dap-ui

            # LSP
            nvim-lsp-file-operations

            # File explorer
            neo-tree-nvim
            nvim-treesitter.withAllGrammars

            # Misc/idk
            plenary-nvim

            # Suggestion pop-up for commands/keys.
            which-key-nvim

            # Highlight word under the cursor.
            vim-illuminate

            # Adds indentation guides.
            indent-blankline-nvim

            # Completion engine while typing.
            nvim-cmp

            # nvim-cmp supporting plugins.
            cmp-nvim-lsp
            cmp-buffer
            cmp-path
            # luasnip
        
            # Improved scrolling behavior.
            neoscroll-nvim

            # Improved behavior for splitting/resizing windows.
            smart-splits-nvim

            # Improved terminal mangement in-editor.
            toggleterm-nvim
        ];

        extraConfig = lib.fileContents ../assets/init.vim;
        extraLuaConfig = lib.fileContents ../assets/neovim_init.lua;
    };
}
