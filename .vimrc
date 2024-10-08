"<F1> - 
"<F2> - збереження
"<F3> - Copilot next
"<F4> - Copilot panel
"<F5> - NERDTreeToggle
"<F6> -
"<F7> - TagbarToggle
"<F8> - pastetoggle 
"<F9> - mouse toggle
"<F10> - збереження і вихід
"<F11> -
"<F12> - вихід без збереження


" Prevent escape from moving the cursor one character to the left
autocmd InsertLeave * :normal `^
" Change cursor shape in different modes
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[ q" "EI = NORMAL mode (ELSE)
" Cursor settings:
" 1 -> blinking block
" 2 -> solid block 
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

set number
" set relativenumber
set backspace=2
set splitright
set splitbelow

set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf-8,cp1251

let mapleader = " "

set mouse=a

set hlsearch "підсвітка пошуку
set incsearch "інкрементальний пошук
set ignorecase "відключити регистир при пошуці
set nowrapscan "відключає круговий прохід при пошуці

let html_no_rendering=1

"For local replace
"nnoremap <leader>r gd:%s/<C-R>///gc<left><left><left>

"Включити розумні відступи
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
set expandtab
set softtabstop=4
set shiftwidth=4

set listchars=eol:↲,tab:→→,trail:•,nbsp:↔
"set list "відображення недрукованих символів

set foldmethod=indent
set nofoldenable

set t_Co=256
set background=dark

set pastetoggle=<F8>

":Explore
let g:netrw_banner = 0 "hide banner above files
let g:netrw_liststyle = 3 "tree instead of plain view
let g:netrw_browse_split = 3 "open file in new tab

"покажчик довжини рядка
set colorcolumn=80
autocmd VimEnter * :highlight LineNr ctermfg=237 ctermbg=None
autocmd VimEnter * :highlight ColorColumn ctermbg=237
"виділення курсора
set cursorline
autocmd VimEnter * :highlight CursorLine term=bold cterm=bold ctermbg=239
autocmd VimEnter * :highlight CursorLineNr term=bold cterm=bold ctermbg=237
autocmd VimEnter * :highlight Search term=reverse cterm=bold ctermfg=208 ctermbg=241
autocmd VimEnter * :highlight IncSearch term=reverse cterm=bold ctermfg=208 ctermbg=241
autocmd VimEnter * :highlight! link Visual CursorLine 
" autocmd VimEnter * :highlight Visual cterm=reverse ctermbg=NONE


call plug#begin('~/.vim/plugged')

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'phanviet/vim-monokai-pro', { 'as': 'monokai-pro' }
Plug 'jacoborus/tender.vim'
Plug 'altercation/vim-colors-solarized', { 'as': 'solarized' }

Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1

Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
syntax enable

Plug 'roxma/vim-tmux-clipboard'

Plug 'tpope/vim-commentary'
vmap gb  <Plug>Commentary
nmap gbb  <Plug>CommentaryLine

Plug 'majutsushi/tagbar' "apt-get install ctags
nmap <F7> :TagbarToggle<CR>

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'


"=============================== AutoComplPop =================================="
Plug 'vim-scripts/AutoComplPop'
" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

"================================= Undotree ===================================="
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>
set undofile                            " Save undos after file closes
set undodir=~/.local/share/undodir/vim  " where to save undo histories
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo

"================================= NERDTree ===================================="
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
nmap <F5> :NERDTreeToggle<CR>
imap <F5> <Esc>:NERDTreeToggle<CR>
vmap <F5> <Esc>:NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMapOpenSplit='x'
let NERDTreeMapOpenVSplit='v'
let g:NERDTreeWinSize=30

"================================= Airline ====================================="
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let airline#extensions#tabline#show_splits = 0
let g:airline_theme = 'dracula'
autocmd VimEnter * :highlight! link airline_tabmod airline_tabsel
autocmd VimEnter * :highlight airline_tabfill ctermbg=None
nmap <C-n> <esc>:tabedit<CR>

"================================= Debuger ====================================="
Plug 'puremourning/vimspector'
let g:vimspector_base_dir = '/home/roman/.vim/plugged/vimspector/'
nmap <leader><F9> :call vimspector#ToggleBreakpoint()<CR>
nmap <leader><F12> :call vimspector#Reset()<CR>
nmap <leader><F1> :call vimspector#ClearBreakpoints()<CR>
nmap <leader><F5> :call vimspector#Launch()<CR>
nmap <leader><F6> :call vimspector#Continue()<CR>
let g:vimspector_sidebar_width = 75
let g:vimspector_bottombar_height = 15

"================================= Copilot ====================================="
Plug 'github/copilot.vim'
imap <F3> <Plug>(copilot-next)
imap <C-]> <Plug>(copilot-dismiss)
nmap <F4> :Copilot panel<CR>
imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

highlight CopilotSuggestion ctermfg=8 ctermbg=237 

"=================================== FZF ======================================="
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :Rg<CR>
nnoremap <Leader>m :Marks<CR>

let g:fzf_height = '50%'
let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--exact']}), <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': ['--exact']}), <bang>0)

" Add to ~/.bashrc - загальні настройки, будуть працювати через :FZF
" if type rg &> /dev/null; then
"   export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git/*"'
"   export FZF_DEFAULT_OPTS='-m --height 70% --border --preview-window "right:60%" --layout=default --margin=0 --preview "batcat --color=always --style=header,grid --line-range :500 {}"'
" fi

"================================  ACK  ========================================"
Plug 'mileszs/ack.vim' " пошук по вмісту файлів проекту
"потрібно також зробити - apt-get install ack-grep, якщо не працює тоді <let g:ackprg = "ag --vimgrep">
":Ack [опції]... шаблон [файл або каталог]
":Ack -i - без врахування регістру
"Пошук шаблонів в кожному вихідному файлі в дереві від поточного каталог вниз.
"Якщо вказані будь-які файли або каталоги, то тільки ті файли і директорії перевіряються.
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window
let g:ack_default_options = " -H -i --nocolor --nogroup --column"
nnoremap <Leader>a :Ack! <Space>

"================================= Vim-LSP ====================================="
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
let g:lsp_settings_filetype_python = ['pyls-all', 'pyright-langserver', 'vscode-json-language-server']

" Configuration options are documented here: https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
let g:lsp_settings = {
\  'pyls-all': {
\    'disabled': 0,
\    'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8', 'pycodestyle'],
\           'plugins': {
\             'flake8': {
\               'enabled': v:false,
\               'ignore': {'E501': v:true},
\               'maxLineLength': 120
\             },
\             'pycodestyle': {
\               'enabled': v:true,
\               'ignore': {'E501': v:true},
\               'maxLineLength': 120
\              },
\           }
\       }
\    }
\  },
\  'pyright-langserver': {
\    'disabled': 1
\  }
\}

nmap gd :LspDefinition<cr>
nmap <leader>r <plug>(lsp-rename)
nnoremap <Leader>d :LspDocumentDiagnostics<CR>
nmap <buffer>K <plug>(lsp-hover)

" let g:lsp_diagnostics_signs_warning = {'text': '‼'}
" let g:lsp_diagnostics_signs_error = {'text': '✘'}
let g:lsp_diagnostics_signs_warning = {'text': ''}
let g:lsp_diagnostics_signs_error = {'text': ''}
let g:lsp_diagnostics_signs_priority_map = {
    \'LspError': 11,
    \'LspWarning': 7,
    \'clangd_LspWarning': 11,
    \'clangd_LspInformation': 11
    \}
autocmd VimEnter * :highlight LspErrorText cterm=None ctermbg=None ctermfg=9
autocmd VimEnter * :highlight LspWarningText cterm=bold ctermbg=None ctermfg=227
autocmd VimEnter * :highlight Error None
autocmd VimEnter * :highlight Todo None
autocmd VimEnter * :highlight SignColumn ctermbg=None

" let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
let g:lsp_diagnostics_virtual_text_prefix = "  "

"Pyls-all disable error
"Autopep8, documentation and config
"documentation = ../site-packages/autopep8-x.x.x.dist-info/METADATA
"config = $HOME/.config/pycodestyle - global configuration file
"configuration file example::
"[pycodestyle]
"max_line_length = 120
"ignore = E501

"============================== asyncomplete =================================="
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"================================= Ctrl-P ====================================="
Plug 'kien/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|env)$',
\ 'file': '\v\.(exe|so|dll|pyc)$',
\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }
" let g:ctrlp_user_command = 'find %s -type f -not -path "*/.git/*"'

"<F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"<c-f> and <c-b> to cycle between modes.
"<c-d> to switch to filename only search instead of full path.
"<c-r> to switch to regexp mode.
"<c-j>, <c-k> or the arrow keys to navigate the result list.
"<c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"<c-n>, <c-p> to select the next/previous string in the prompt's history.
"<c-y> to create a new file and its parent directories.
"<c-z> to mark/unmark multiple files and <c-o> to open them.
"=============================================================================="

call plug#end()

" colorscheme gruvbox
" colorscheme dracula
" colorscheme onehalfdark
" colorscheme molokai
colorscheme monokai_pro
" colorscheme tender
" colorscheme solarized
" highlight Normal ctermbg=235
highlight Pmenu ctermbg=235


nmap <leader>b :Buffers<CR>

" nmap gt :tabnext<CR> \| :bnext<CR>

nmap <leader>c :bdelete<CR>

nmap <leader>t :terminal<CR>

nmap <F1> :nohlsearch<CR>

nmap <F2> :w<CR>
vmap <F2> <Esc>:w<CR>
imap <F2> <Esc>:w<CR>

nmap <F10> :wq<CR>
vmap <F10> <Esc>:wq<CR>
imap <F10> <Esc>:wq<CR>

nmap <F12> :q!<CR>
vmap <F12> <Esc>:q!<CR>
imap <F12> <Esc>:q!<CR>

nnoremap <Tab> <C-w>w

"Save the visual selection after having pressed > or <
vnoremap L >gv
vnoremap H <gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv

" paste over a selection it will replace the default register with the contents of the selection
" xnoremap p pgvy
xnoremap p "_dP

" :%!jq
command! FormatJson %!python -m json.tool
command! FormatXml %!python -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"


"============================== Mouse toggle ==================================="
fun! g:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

noremap <F9> :call <SID>ToggleMouse()<CR>
inoremap <F9> <Esc>:call <SID>ToggleMouse()<CR>a
"=============================================================================="


".vimspector.json, copy this file to project folder
"{
"    "configurations": {
"        "debugpy": {
"            "adapter": "debugpy",
"            "configuration": {
"                "type": "python",
"                "request": "launch",
"                "program": "${file}"
"            },
"            "breakpoints": {
"                "exception": {
"                    "raised": "N",
"                    "uncaught": "Y",
"                    "userUnhandled": "N"
"                }
"            }
"        }
"    }
"}

"Django project config
"{
"    "$shema": "https://puremourning.github.com/vimspector/schema/vimspector.schema.json",
"    "configurations": {
"        "django": {
"            "adapter": "debugpy",
"            "configuration": {
"                "request": "launch",
"                "python": "${VIRTUAL_ENV}/bin/python3",
"                "program": "${workspaceRoot}/manage.py",
"                "args": [ "runserver", "0.0.0.0:8000", "--noreload" ],
"                "django": true,
"                "stopOnEntry": true
"            },
"            "breakpoints": {
"                "exception": {
"                    "raised": "N",
"                    "uncaught": "Y",
"                    "userUnhandled": "N"
"                }
"            }
"        }
"    }
"}

"Celery
"{
"    "configurations": {
"        "debugpy": {
"            "adapter": "debugpy",
"            "configuration": {
"                "type": "python",
"                "python": "${VIRTUAL_ENV}/bin/python",
"                "request": "launch",
"                "cwd": "${workspaceRoot}",
"                "program": "/opt/test/env/bin/celery",
"                "args": [ "-A", "test_celery", "worker", "-l", "INFO" ]
"            },
"            "breakpoints": {
"                "exception": {
"                    "raised": "N",
"                    "uncaught": "Y",
"                    "userUnhandled": "N"
"                }
"            }
"        }
"    }
"}
