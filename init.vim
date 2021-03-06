set nocompatible              " be iMproved, required
filetype off                  " required

set clipboard=unnamedplus

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'andymass/vim-matchup'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-vinegar'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-speeddating'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tmux-plugins/vim-tmux'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'edkolev/promptline.vim'

Plugin 'Townk/vim-autoclose'

Plugin 'svermeulen/vim-easyclip'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

Plugin 'Shougo/deoplete.nvim'

Plugin 'vim-syntastic/syntastic'

Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi'

Plugin 'carlitux/deoplete-ternjs'
Plugin 'zchee/deoplete-jedi'

Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'

Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'

Plugin 'lervag/vimtex'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'ervandew/supertab'

Plugin 'rhysd/vim-grammarous'

Plugin 'plytophogy/vim-virtualenv'

" Colors
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:python_host_prog = expand('~') . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = expand('~') . '/.pyenv/versions/neovim3/bin/python'

" Use deoplete.
let g:deoplete#enable_at_startup=1

filetype plugin indent on    " required
syntax on
" set omnifunc=syntaxcomplete#Complete

colorscheme dracula

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor

hi MatchParen cterm=italic gui=italic

set showmatch
set ignorecase
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list

" set splitbelow
set splitright

set laststatus=2

let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_remap_spacebar=1

" let g:SuperTabClosePreviewOnPopupClose = 1
" let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabCrMapping=1

" SuperTab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText','s:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
let g:SuperTabMappingBackward = "<s-tab>"
let g:SuperTabMappingTabLiteral = "<c-tab>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1
let g:SuperTabClosePreviewOnPopupClose = 1
autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, "<c-p>") | endif

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup()
endfunction

" " deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" resize windows when vim is resized
autocmd VimResized * wincmd =

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map :s5 :source % \| AirlineRefresh \| nohlsearch

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:tmuxline_preset = 'full'

" let g:tmuxline_powerline_separators = 0

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v<C-l>

nmap <esc><esc> :noh<return>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" easyclip stuff
let g:EasyClipUseSubstituteDefaults = 1

nnoremap gm m
nmap M <Plug>MoveMotionEndOfLinePlug

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" tex stuff
au BufNewFile,BufRead *.tex set filetype=tex
let g:syntastic_tex_chktex_quiet_messages = { "regex": ["Vertical rules", "put a space"] }
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1

set cul
set lz

" git mappings
nnoremap ,gs :Gstatus<CR>
nnoremap ,gd :Gdiff<CR>
nnoremap ,gb :Gblame<CR>
nnoremap ,gL :exe ':!cd ' . expand('%:p:h') . '; git la'<CR>
nnoremap ,gl :exe ':!cd ' . expand('%:p:h') . '; git las'<CR>
nnoremap ,gh :Silent Glog<CR>
nnoremap ,gH :Silent Glog<CR>:set nofoldenable<CR>
nnoremap ,gr :Gread<CR>
nnoremap ,gw :Gwrite<CR>
nnoremap ,gp :Git push<CR>
nnoremap ,g- :Silent Git stash<CR>:e<CR>
nnoremap ,g+ :Silent Git stash pop<CR>:e<CR>

