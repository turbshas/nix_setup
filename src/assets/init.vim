" -------------------------------------------------------------
" Settings
" -------------------------------------------------------------
" set nocompatible "Forget being compatible with good ol' vi
" syntax on "turn on syntax highlighting
" 
" set number
" set relativenumber
" set hidden " Allow hidden buffers.
" set mouse+=a
" 
" "tab settings
" set expandtab "expand tabs to spaces
" set tabstop=4 "number of spaces that a <tab> in the file counts for
" set softtabstop=4 "number of spaces that a <tab> counts for while performing editing operations
" set shiftwidth=4
" set autoindent "automatically align to indentation for a new line
" 
" set hlsearch " turn on search pattern highlighting
" set ignorecase " ignore case when searching...
" set smartcase " ... unless pattern has uppercase character
" set incsearch " enable incremental matches
" set list " display tabs and line endings
" set listchars=trail:-,tab:-- " change the way tabs and line ends are displayed
" 
" " -------------------------------------------------------------
" " Key mappings
" " -------------------------------------------------------------
" " barbar
" " Move to previous/next
" nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
" nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" 
" " Re-order to previous/next
" nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
" nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" 
" " Goto buffer in position...
" nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
" nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
" nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
" nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
" nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
" nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
" nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
" nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
" nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
" nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" -------------------------------------------------------------
" Stuff that needs to run after all plugins/configs are loaded.
" -------------------------------------------------------------
function! RuntimeCommands()
    Neotree source=filesystem reveal=true position=left action=show
endfunction

if v:vim_did_enter
    call RuntimeCommands()
else
    autocmd VimEnter * call RuntimeCommands()
endif
