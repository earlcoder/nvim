

call plug#begin('~/.local/share/nvim/plugged')
" FISH
  Plug  'dag/vim-fish'
" COLOR
  Plug  'morhetz/gruvbox' 
  Plug  'crusoexia/vim-monokai' 
  Plug  'ayu-theme/ayu-vim'
  Plug  'chriskempson/base16-vim'
  Plug  'romainl/Apprentice'
  Plug  'dracula/vim', { 'as': 'dracula' }
  Plug  'phanviet/vim-monokai-pro'
  Plug  'NLKNguyen/papercolor-theme'
" SYNTAX
  Plug  'vim-airline/vim-airline-themes'
" NERDTREE
  Plug  'Xuyuanp/nerdtree-git-plugin'
  Plug  'scrooloose/nerdtree'
  Plug  'ryanoasis/vim-webdevicons'
  Plug  'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug  'ErichDonGubler/vim-sublime-monokai'
  Plug  'ryanoasis/vim-devicons'
" AUTOCOMPLETE
  Plug  'w0rp/ale' 
  Plug  'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlug ins' } 
  Plug  'jiangmiao/auto-pairs'
  Plug  'bling/vim-airline' 
  Plug  'neomake/neomake'
" RUST
  Plug  'rust-lang/rust.vim'
  Plug  'racer-rust/vim-racer'
"  Plug  '907th/vim-auto-save'
  Plug  'tpope/vim-surround'
" DOCKER
  Plug  'ekalinin/Dockerfile.vim'
" GO
  Plug  'sebdah/vim-delve' 
  Plug  'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 
  Plug  'fatih/molokai'
  Plug  'deoplete-plugins/deoplete-go', { 'do': 'make'} 
  Plug  'buoto/gotests-vim'
  Plug  'easymotion/vim-easymotion'
  Plug  'uarun/vim-protobuf'
" GENERAL
  Plug  'brooth/far.vim'
  Plug  'ctrlpvim/ctrlp.vim' 
  Plug  '/usr/local/opt/fzf'
  Plug  'junegunn/fzf.vim'
  Plug  'rakr/vim-one'
  Plug  'Shougo/neosnippet-snippets'
  Plug  'Shougo/neosnippet'
  Plug  'airblade/vim-gitgutter' 
  Plug  'vim-airline/vim-airline' 
  Plug  'lambdalisue/gina.vim' 
  Plug  'milkypostman/vim-togglelist'
  Plug  'terryma/vim-multiple-cursors'
  " PYTHON
  Plug  'tmhedberg/SimpylFold' 
  Plug  'vim-scripts/indentpython.vim'
  Plug  'deoplete-plugins/deoplete-jedi'
  Plug  'vim-syntastic/syntastic'
  Plug  'nvie/vim-flake8'
  " JS
  Plug  'wokalski/autocomplete-flow'
  " Terraform
  Plug 'hashivim/vim-terraform'
  Plug 'vim-syntastic/syntastic'
  Plug 'juliosueiras/vim-terraform-completion'
call plug#end() 

"----------------------
" Python path
"----------------------
let g:python4_host_prog='/usr/local/bin/python3'


"-----------------------
" General Settings
"-----------------------

set autowrite
set noswapfile 
set encoding=utf8 
set termguicolors 
set nu 
set autoindent 
set smartindent 
set tw=79

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:auto_save = 1

highlight CursorLine cterm=bold guibg=Grey40


autocmd InsertLeave * write



"----------------------
" Colors
"----------------------

syntax enable 
set background=dark

if (has("termguicolors"))
	set termguicolors
endif

colorscheme PaperColor

"----------------------
" Key Mapping
" --------------------_
let mapleader = ',' 

nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
imap jj <Esc>
map ff :Files<CR>
nmap <silent> <leader>an :ALENext<cr>
nmap <Esc> :w<cr> 
nmap <silent> <leader>ap :ALEPrevious<cr>



"----------------------
" NERDTree
" _____________________
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"---------------------
" AIRLINE
"______________________
let g:ale_completion_enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

"----------------------
" Icons
" ---------------------
let g:webdevicons_enable = 1 
let g:webdevicons_enable_nerdtree = 1 
let g:webdevicons_enable_airline_tabline = 1 
let g:webdevicons_enable_airline_statusline = 1 

"----------------------
" Golang
"----------------------
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goreturns"
let g:go_list_type = 'quickfix'
let g:go_info_mode='gocode'
let g:go_def_mode='guru'
let g:go_metalinter_enabled = ['vet', 'staticcheck']
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"

au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gv :GoVet<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go map  <F6> :NERDTreeToggle<cr>
au FileType go nmap <F12> <Plug>(go-def)



"-----------------------
" NeoMake
"-----------------------
call neomake#configure#automake('w')
autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }


"-----------------------
" ALE
"-----------------------
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'


"------------------------
" NeoSinppet
"-----------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


"------------------------
" DeoPlete
"------------------------
let g:deoplete#enable_at_startup = 1
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction 






"-----------------------
" Terraform
"-----------------------



"-----------------------
" Syntastic Config
"-----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()
