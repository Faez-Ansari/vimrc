vim.cmd([[ 
set title
set shiftwidth=2
set tabstop=2
set expandtab
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set smartcase
set scrolloff=10
set cursorline
set so=20
set nobackup
set nowb
set noswapfile
set hidden
set number relativenumber
set lazyredraw
set magic
map <C-l> :bnext<cr>
map <C-h> :bprevious<cr>
map <C-c> :bd<cr>
map <leader>, :edit ~/.config/nvim/init.vim<CR>
map { {zz
map } }zz
let python_highlight_all=1

 nnoremap <leader>e :NERDTreeToggle<CR>
 map <leader>h <C-w>h
 map <leader>j <C-w>j
 map <leader>k <C-w>k
 map <leader>l <C-w>l

  nnoremap n nzz
  nnoremap N Nzz
  nnoremap c "_c
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  map <TAB> %
  map <leader>pi :PlugInstall<CR>
  map <leader>pc :PlugClean<CR>
  map <leader>s :source ~/.config/nvim/init.vim<CR>
  map <leader><leader> :w<CR>
  map <leader>q :q<CR>
  map <leader>wq :wq<CR>
  map <leader>l :bnext<cr>
  map <leader>h :bprevious<cr>

  let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  map <leader>v :VimwikiIndex
  let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
  autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
  autocmd BufRead,BufNewFile *.tex set filetype=tex

let g:fzf_layout = {'window':{'width':0.8,'height':0.8}}
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffer<CR>

let FZF_DEFAULT_COMMAND='rg --files'
let FZF_DEFAULT_OPTS='-m --height 50% --border --reverse'

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nmap <Leader>g [fzf-p]
xmap <Leader>g [fzf-p]

nnoremap <silent> [fzf-p]s     :Git<CR>
nnoremap <silent> [fzf-p]j     :diffget //2<CR>
nnoremap <silent> [fzf-p]k     :diffget //3<CR>
nnoremap <silent> [fzf-p]ps    :!sh ~/.scripts/origin.sh<CR>
nnoremap <silent> [fzf-p]pl    :Git pull<CR>
nnoremap <silent> [fzf-p]c     :GBranches<CR>
nnoremap <silent> [fzf-p]t     :Git stash<CR>
nnoremap <silent> [fzf-p]tp     :Git stash pop<CR>

]])
