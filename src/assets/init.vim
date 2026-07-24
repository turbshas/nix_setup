" -------------------------------------------------------------
" Stuff that needs to run after all plugins/configs are loaded.
" -------------------------------------------------------------
function! RuntimeCommands()
    "Neotree source=filesystem reveal=true position=left action=show
endfunction

if v:vim_did_enter
    call RuntimeCommands()
else
    autocmd VimEnter * call RuntimeCommands()
endif
