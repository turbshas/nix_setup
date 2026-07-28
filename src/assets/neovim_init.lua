------------------------------------
-- Settings
------------------------------------

-- vim.cmd.colorscheme colorscheme "catppuccin-nvim" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme("tokyonight-storm") -- tokyonight, -night, -day, -moon
vim.cmd.colorscheme("dracula") -- dracula, -soft

vim.opt.syntax = "on" -- turn on syntax highlighting
vim.cmd.filetype("on") -- enable file specific behaviour
vim.cmd.filetype("plugin on") -- recognize what kind of file we are editing - c file, .h or makefile etc.

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true -- Allow hidden buffers.
vim.opt.mouse = "a"

-- tab settings
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.tabstop = 4 -- number of spaces that a <tab> in the file counts for
vim.opt.softtabstop = 4 -- number of spaces that a <tab> counts for while performing editing operations
vim.opt.shiftwidth = 4
vim.opt.autoindent = true -- automatically align to indentation for a new line

vim.opt.hlsearch = true -- turn on search pattern highlighting
vim.opt.ignorecase = true -- ignore case when searching...
vim.opt.smartcase = true -- ... unless pattern has uppercase character
vim.opt.incsearch = true -- enable incremental matches
vim.opt.list = true -- display tabs and line endings
vim.opt.listchars = "trail:-,tab:--" -- change the way tabs and line ends are displayed

vim.opt.wildmenu = true -- Enable enhanced command-line completion
vim.opt.lazyredraw = true -- no screen redraw while executing macros, registers and other commands that haven't been typed
-- Disabled because it messes with the file tree.
-- vim.opt.autochdir = true -- change the working directory to the directory in which the file being opened lives
vim.opt.cursorline = true -- highlight current line
vim.opt.cinoptions = ":0,b1:" -- align switch case and break on switch statement
vim.opt.history = 1000 -- remember 1000 commands/search strings

vim.opt.autoread = true -- reread file if an external program has changed a file
vim.opt.showmode = true -- show what mode we are in (insert, command, visual etc)
-- vim.opt.statusline.append { "%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P" } -- show full path name of the file in the status bar
vim.opt.laststatus = 2 -- Always show the status line
vim.opt.showtabline = 2 -- Always show the buffer line
vim.opt.termguicolors = true -- Enable 24-bit colours.

-- Use Ag over Grep
vim.opt.grepprg = "ag --nogroup --nocolor"

-- -------------------------------------------------------------
-- Key mappings
-- -------------------------------------------------------------
vim.g.mapleader = "<Space>"
local map = vim.keymap.set
local opts = { noremap = true, silent = true, remap = true }
local silentOpts = { silent = true, }

-- gcc/gc toggle comment current/visual-mode selected lines
map('n', '<A-/>', '<Cmd>norm gcc<CR>', opts)
map('v', '<A-/>', '<Cmd>norm gc<CR>', opts)
map('i', '<A-[>', '<Esc>', opts) -- replacement for ctrl+[
map('v', '<A-[>', '<Esc>', opts) -- replacement for ctrl+[
map('n', '<A-w>', '<C-w>', opts) -- ctrl+w starts window selection

-- barbar ---------------
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Close buffer without closing window (moves to next buffer, then deletes previous).
map('n', '<A-d>', '<Cmd>BufferNext<CR><Cmd>BufferDelete#<CR>', opts)

-- if our '{' or '}' are not in the first column for a function, use find
map("", "[[", "?{<CR>w99[{:nohl<CR>", silentOpts)
map("", "][", "/}<CR>b99]}:nohl<CR>", silentOpts)
map("", "]]", "j0[[%/{<CR>:nohl<CR>", silentOpts)
map("", "[]", "k$][%?}<CR>:nohl<CR>", silentOpts)

-- Key commands to copy/paste from system clipboard.
map("v", "<C-c>", "\"+y", opts)
map("n", "<A-y>", "\"+y", opts)
map("v", "<A-y>", "\"+y", opts)
map("n", "<A-x>", "\"+d", opts)
map("v", "<A-x>", "\"+d", opts)
map("n", "<A-p>", "\"+p", opts)
map("v", "<A-p>", "\"+p", opts)

-- Ctrl-V to paste in insert mode.
map("i", "<C-v>", "<C-r>+", opts)

-- Telescope shortcuts
local tsb = require('telescope.builtin')
map('n', '<leader>ff', tsb.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', tsb.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', tsb.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', tsb.help_tags, { desc = 'Telescope help tags' })

-- Changing current buffer highlight to be more noticeable.
function setColors()
    local current_fg = "#4c4f6a"
    local current_bg = "#eff1f6"
    vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = current_fg, bg = current_bg })
    vim.api.nvim_set_hl(0, 'BufferCurrentSignRight', { fg = current_fg, bg = current_bg })
end

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function ()
        setColors()
    end,
})

setColors()

-------------------------
-- Plugin configs
-------------------------
-- telescope.nvim ----------
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    extensions = {
        -- telescope-fzf-native.nvim
        fzf = {
        fuzzy = true,                    -- false will only do exact matching
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
----------------------------

-- indent-blankline.nvim ---
require("ibl").setup()
----------------------------

-- nvim-cmp.nvim -----------
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' },
        { name = 'buffer' },
        {
            name = 'path',
            option = {
                pathMappings = {
                    ['@'] = '${folder}/src',
                },
            },
        },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- vim.lsp.config('<YOUR_LSP_SERVER>', {
--     capabilities = capabilities
-- })
-- vim.lsp.enable('<YOUR_LSP_SERVER>')
----------------------------

require("gitsigns").setup()
require("toggleterm").setup()
require("barbar").setup({
    icons = {
        buffer_index = "subscript",
        gitsigns = {
          added = {enabled = true, icon = '+'},
          changed = {enabled = true, icon = '~'},
          deleted = {enabled = true, icon = '-'},
        },
        separator = { left = "|", right = "|" },
        separator_at_end = true,
        preset = "powerline",
    },
})
require('gitsigns').setup()
require("nvim-web-devicons").setup()
require("staline").setup({
    defaults = {
        full_path = true,
    },
    sections = {
        left = { '- ', '-mode', 'left_sep_double', ' ', 'branch', "lsp" },
        mid  = { 'file_name' },
        right = { 'cool_symbol','right_sep_double', '-line_column' },
    }
})
require('neo-tree').setup({
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            never_show = {
                ".git",
            },
        },
        use_libuv_file_watcher = true,
    },
})
