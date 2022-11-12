nnoremap <SPACE> <Nop>
let mapleader =" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf',{'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'sbdchd/neoformat'
Plug 'itchyny/vim-gitbranch'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'bkad/camelcasemotion'
Plug 'rhysd/clever-f.vim'
Plug 'preservim/nerdcommenter'
Plug 'keyvchan/vim-monokai'
Plug 'crusoexia/vim-javascript-lib'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dikiaap/minimalist'
Plug 'yuezk/vim-js'
Plug 'mhinz/vim-startify'
Plug 'mlaursen/vim-react-snippets'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-repeat'
Plug 'iamcco/markdown-preview.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'hankchiutw/nerdtree-ranger.vim'
call plug#end()

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
let g:closetag_filenames = "*.js"
map <C-l> :bnext<cr>
map <C-h> :bprevious<cr>
map <C-c> :bd<cr>
map <leader>, :edit ~/.config/nvim/init.vim<CR>
map { {zz
map } }zz
let python_highlight_all=1

" Auto resizing splits
autocmd VimResized * wincmd =

colorscheme monokai
set termguicolors
let g:vim_jsx_pretty_template_tags=['html','js','jsx']

:echo gitbranch#name()

" Some basics:
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

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>m :Goyo \| set bg=dark \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
 map <leader>h <C-w>h
 map <leader>j <C-w>j
 map <leader>k <C-w>k
 map <leader>l <C-w>l

" Replace ex mode with
	map Q @@

" Check file in shellcheck:
	map <leader>sc :!clear && shellcheck -x %<CR>

"Open my bibliography file in split
"map <leader>b :vsp<space>$BIB<CR>
"map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>C :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=dark
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>H :call ToggleHiddenAll()<CR>

" fzf
let g:fzf_layout = {'window':{'width':0.8,'height':0.8}}
nnoremap <leader>f :CocCommand fzf-preview.ProjectMruFiles<CR>
nnoremap <leader>F :CocCommand fzf-preview.MruFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffer<CR>

let FZF_DEFAULT_COMMAND='rg --files'
let FZF_DEFAULT_OPTS='-m --height 50% --border --reverse'

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" Fugitive


nmap <Leader>g [fzf-p]
xmap <Leader>g [fzf-p]

nnoremap <silent> [fzf-p]s     :Git<CR>
nnoremap <silent> [fzf-p]j     :diffget //2<CR>
nnoremap <silent> [fzf-p]k     :diffget //3<CR>
nnoremap <silent> [fzf-p]a     :CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]B     :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p];     :CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]r     :CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]r     "sy:-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]ps    :Git push -u origin HEAD<CR>
nnoremap <silent> [fzf-p]pl    :Git pull<CR>
nnoremap <silent> [fzf-p]c     :GBranches<CR>
nnoremap <silent> [fzf-p]t     :Git stash<CR>
nnoremap <silent> [fzf-p]tp     :Git stash pop<CR>

" Coc

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

"" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""multi-cursor
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

"" Explorer
" nnmap <leader>e <Cmd>CocCommand explorer<CR>
nnoremap <leader>e :NERDTreeToggle<CR>

" CamelCase
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
sunmap w
sunmap b
sunmap e

" Airline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'

" Markdwon preview
nmap <silent> <F8> <Plug>MarkdownPreview
