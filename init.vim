if empty(glob('~/.config/nvim/autoload'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set clipboard=unnamedplus

call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-vinegar'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'svermeulen/vim-easyclip'
Plug 'ervandew/supertab'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

colorscheme dracula

" key mappings

" move around windows with ctrl +hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v<C-l>

" easily clear highlights
nmap <esc><esc> :noh<return>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" easyclip stuff
let g:EasyClipUseSubstituteDefaults = 1
nnoremap gm m
nmap M <Plug>MoveMotionEndOfLinePlug

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
