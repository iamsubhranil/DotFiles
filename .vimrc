set nocompatible   	" Disable vi-compatibility
set t_Co=256        " Use 256 Colors in terminal

filetype off		              " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set runtime path to include Vundle
call vundle#begin()               " init Vundle
Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'rust-lang/rust.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-polyglot'
" Plugin 'valloric/MatchTagAlways'
" Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'dense-analysis/ale'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'mileszs/ack.vim'
" Plugin 'skwp/greplace.vim'
" Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'tobyS/vmustache'
" Plugin 'duggiefresh/vim-easydir'
" Plugin 'tobyS/pdv'
Plugin 'NLKNguyen/copy-cut-paste.vim'
" Plugin 'tpope/vim-bundler'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-dispatch'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
Plugin 'editorconfig/editorconfig-vim'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'posva/vim-vue'
Plugin 'Dru89/vim-adventurous'
" Plugin 'beigebrucewayne/hacked_ayu.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'rhysd/vim-clang-format'
" Plugin 'shirk/vim-gas'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

packadd termdebug

" Put your non-Plugin stuff after this line
set shell=/bin/zsh	" zsh is cooler than bash

" Color Settings
syntax enable
set background=dark
if filereadable(expand("~/.vimrc_background"))
  " let base16colorspace=256
  source ~/.vimrc_background
endif
"colorscheme gruvbox
set encoding=utf8

" gVim - Gui Settings
if has("gui_running")
    set guioptions-=m   " Removes top menu bar
    set guioptions-=T   " Removes top toolbar
    set guioptions-=r   " Removes right hand scroll bar
    set guioptions-=L   " Removes left hand scroll bar
    set guifont=FuraMonoForPowerline\ Nerd\ Font\ Regular\ 12
endif

set wrap                        " wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep
"set relativenumber              " show line numbers relative to cursor position
set splitbelow                  " create split below when doing horizontal split
set splitright                  " create split on right when doing a vertical split
set incsearch
set timeout timeoutlen=200 ttimeoutlen=100
highlight clear SignColumn
highlight clear LineNr " clear the line number background

" Group all swp files and backups into a dir
set backupdir=~/.vim/backups
set directory=~/.vim/backups

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"Easy escaping to normal mode
imap jk <esc>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:wall<cr>
imap <C-s> <esc>:wall<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
map <C-t> <esc>:tabnew<cr>

nmap <leader>vr :edit ~/dotfiles/.vimrc<cr>
nmap <leader>zr :edit ~/.zshrc<cr>
nmap <leader>i3 :edit ~/dotfiles/.i3/config<cr>

"Change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>pd :pwd<cr>
"Reload the current buffer
nnoremap <leader>r :e!<cr>
"Open a file browser in the current buffer
nnoremap <leader>f :e .<cr>
nnoremap <leader>of :exe ':silent !firefox %'<CR>

" Misc helpers
" Quickly add semi-colon to end of current line
nmap ;; A;<esc>
nmap <leader><space> i<space><esc>
" Quickly insert blank line
nnoremap <leader>o o<esc>
" Quickly move the text following the cursor to the line below
nmap <leader>j i<cr><esc>
" Open splits
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>
" Open a new buffer
nmap <leader>n :new<cr>
nmap <leader>tt :%s/\s\+$//ei<cr>:w<cr>

" Resize vsplit;
nnoremap ;h :vertical resize +5<cr>
nnoremap ;l :vertical resize -5<cr>
nnoremap ;k :resize +5<cr>
nnoremap ;j :resize -5<cr>
nnoremap <leader>1 <c-w>=
nnoremap <leader>2 <C-h>:vertical resize 120<cr>

" Tab handling
set nohidden "remove file from buffer when closing tab
map <leader>l :tabnext<cr>
map <leader>m :tabprevious<cr>

" Easier window navigation
nnoremap <C-h> <C-m>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Familiar copy/cut/paste to clipboard shortcuts
let g:copy_cut_paste_no_mappings = 1
nmap <C-c> <Plug>CCP_CopyLine
vmap <C-c> <Plug>CCP_CopyText
nmap <C-v> <Plug>CCP_PasteText

" Vim Session Handling vim-session
set sessionoptions-=buffers
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_persist_colors = 0

" NerdTree Stuff
nmap <C-b> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMouseMode=2
let NERDTreeWinPos='left'
"let NERDTreeMinimalUI=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom global higlighting enabled for all colorscheme
"highlight CursorLineNr ctermfg=214 ctermbg=bg guibg=bg

" Airline Stuff
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always show the statusline
set showtabline=2   " Always show the tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='term'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" Edit todo list for project
nmap <leader>todo vs :e todo.md<cr>

" common annoying typos
command! Q q " Bind :Q to :q
command! Qa qa
command! Wq wq

" Custom script to generate awesome ctags for Laravel projects
nmap <leader>ct :! ~/dotfiles/scripts/laravel_ctags.sh .<cr>

" Use Silver Searcher instead of grep (Greplace/Ack.vim settings)
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading --ignore node_modules --ignore vendor'
let g:ackprg = 'ag --vimgrep'
nmap <leader>s :Ack! '' ./<C-Left><Left><Left>
nnoremap <leader>gs :Gsearch<cr>
nnoremap <leader>gr :Greplace<cr>a:wall<cr>

" CtrlP Stuff
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Use custom agignore file, skip vcs ignore files, show hidden files
let g:ctrlp_user_command = 'ag %s --path-to-ignore=/home/iamsubhranil/.vim/.agignore -l -U --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
nmap <leader>p :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'

" EditorConfig Settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" GitGutter Settings
nnoremap <Leader>hp :GitGutterPreviewHunk<cr>

" PHP stuff
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let g:phpcomplete_mappings = {
  \ 'jump_to_def': '<leader>g',
  \ }


" PHP docblocks
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>

" Emmet Settings
let g:user_emmet_leader_key = '<C-e>'

" YouCompleteMe Settings
" let g:ycm_register_as_syntastic_checker = 0
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_global_ycm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
set completeopt-=preview
highlight Pmenu ctermfg=2 ctermbg=0 guifg=#ffffff guibg=#000000
highlight PmenuSel ctermfg=3 ctermbg=0 guifg=#ffffff guibg=#000000
let g:ycm_python_binary_path = 'python'
" let g:ycm_rust_src_path = '.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

" Ultisnips Settings
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-]>"
let g:UltiSnipsJumpBackwardTrigger="<c-[>"

" Html MatchTagsAlways Settings
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade' : 1,
    \ 'vue' : 1,
    \ 'php' : 1,
    \}

" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Jump to the last opened position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

hi Normal guibg=NONE ctermbg=NONE

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_rust_checkers = ['cargo']
" let g:syntastic_enable_signs = 1
let g:syntastic_loc_list_height = 1

let g:rustfmt_autosave = 1


if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, '8085') == -1
  augroup filetypedetect
au BufNewFile,BufRead *.8085 setf 8085
  augroup end
endif

let g:omni_sql_no_default_maps = 1

autocmd FileType c,cpp,objc ClangFormatAutoEnable

if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'next') == -1
  augroup filetypedetect
  " dlang, from dcov.vim in JesseKPhillips/d.vim
autocmd BufNewFile,BufRead *.n set filetype=next
  augroup end
endif

autocmd BufNewFile,BufRead *.S set filetype=asm

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'black'],
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1
