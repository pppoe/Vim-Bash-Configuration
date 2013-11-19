""""""""""""""""""""""""""""""""""""""""
"" Toggle QuickFix Window
""""""""""""""""""""""""""""""""""""""""
function! ToggleQFWin()
    if !exists('s:qfwinshow')
        let s:qfwinshow = 0
    endif

    if s:qfwinshow == 1
        let s:qfwinshow = 0
        cclose
    else
        let s:qfwinshow = 1
        copen
    endif
endfunction
nmap <leader>qf :call ToggleQFWin() <CR>
nmap <F6> :cnext <CR>
nmap <F7> :cprevious <CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"" Tags Generation 
""""""""""""""""""""""""""""""""""""""""
nmap <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Make File Tasks
""""""""""""""""""""""""""""""""""""""""
nmap mff :set fdm=syntax <CR>
nmap mkk :make -j <CR>
nmap mkr :make clean && make -j <CR>
nmap mrr :make run <CR>
nmap mcc :make clean <CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""
function! CallAutoLatex()
    nmap mkk :!pdflatex % <CR>
    nmap mrr :!open *.pdf <CR>
endfunction
autocmd BufEnter,BufNewFile,BufNew,BufRead *.tex call CallAutoLatex()

""""""""""""""""""""""""""""""""""""""""
" C/C++ Dev
""""""""""""""""""""""""""""""""""""""""
let g:C_Styles = { '*.c,*.h' : 'default', '*.cc,*.cpp,*.hh,*.hpp' : 'CPP' }
"au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose |endif
nmap ) :cn <CR>
nmap ( :cp <CR>
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Doxygen Plugin
""""""""""""""""""""""""""""""""""""""""
"let g:DoxygenToolkit_blockHeader="-----------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="-----------------------------------------------------"
let g:DoxygenToolkit_authorName="Haoxiang Li"
let g:DoxygenToolkit_licenseTag=""

""""""""""""""""""""""""""""""""""""""""
" Octave
""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter,BufNewFile,BufNew,BufRead *.oct set syntax=octave omnifunc=syntaxcomplete#Complete
autocmd BufNewFile,BufRead *.cpp,*.cc set syntax=cpp11
autocmd BufNewFile,BufRead *.conf set syntax=conf
autocmd BufNewFile,BufRead,BufNewFile,BufEnter *.rb set sw=2
autocmd BufNewFile,BufRead,BufNewFile,BufEnter *.erb set syntax=html
