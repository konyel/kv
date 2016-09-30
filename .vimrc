syntax enable
syntax on
colorscheme evening

set backspace=indent,eol,start

"Tlist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:Tlist_WinWidth=45
let g:winManagerWidth=50
let g:winManagerWindowLayout='FileExplorer'
nmap <F10> :Tlist<CR>
     \:vsplit<CR>


nmap <F11> :call BuildCscope()<CR>
func! BuildCscope()
    let findpath = getcwd()
    exec "!find " .findpath. " -name \"*.c\" -o -name \"*.cpp\" -o -name \"*.h\" -o -name \"*.py\"  -o -name \"*.cc\" -o -name \"*.jce\">./cscope.files  "
    exec ":!cscope -bkq -icscope.files"
endfunc

if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    nmap <F5>s :cs find s <C-R>=expand("<cword>")<CR><CR> :cw<CR>
    nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <F5>c :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
    nmap <F5>t :cs find t <C-R>=expand("<cword>")<CR><CR> :cw<CR>
    nmap <F5>e :cs find e <C-R>=expand("<cword>")<CR><CR> :cw<CR>
    nmap <F5>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :cw<CR>
    nmap <F5>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> :cw<CR>
    nmap <F5>d :cs find d <C-R>=expand("<cword>")<CR><CR> :cw<CR>
endif

" auto reload
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
    set csto=1
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
        let cscope_file=findfile("cscope.out", ".;")
        "echo cscope_file
        if !empty(cscope_file) && filereadable(cscope_file)
            exe "cs add" cscope_file
        endif
     endif
endif

nmap <F7>  :wall!<CR>:make build -S -D release -m64 .<CR>:cw<CR>
"ctags related setting
"set tags=tags,tagsx
"set tags=tags
"set tags+=~/.vim/systags

"highlight search
:set hls

"set line num
set nu

"mru file
let MRU_File=$HOME. '/.vim/mru_files.txt'
let MRU_Max_Entries=50000
let MRU_Window_Height=10
let MRU_Auto_Close=1

nmap <F9> :MRU<CR>

augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=python
augroup end

set expandtab
set tabstop=4
set shiftwidth=4

"change line
:set wrap
:set encoding=utf-8

"upper
:set ic

nmap <C-l> :CtrlPMRU<CR>
