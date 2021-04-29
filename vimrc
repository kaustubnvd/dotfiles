inoremap jj <Esc>

" Syntax highlighting
syntax on

" Highlight matching braces
set showmatch

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

colorscheme nord

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Change default 8 character tab to 4 character
set tabstop=4 softtabstop=4
set shiftwidth=4

" Convert tabs to spaces
" set expandtab

" Indentation
set smartindent

" No wrap
set nowrap

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Update faster for git gutter
set updatetime=100

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

"Enable mouse support
set mouse+=a

" More convenient searching
set ignorecase
set smartcase
set incsearch

" Load plugins
packloadall

" NerdTree keybind for toggle
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-g> :GitGutterLineHighlightsToggle<CR>

" Shortcut split navigation for NerdTree
map <C-h> <C-w>h
map <C-l> <C-w>l

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> 

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Synchronize default register and clipboard register
set clipboard^=unnamed

" if has('gui_running')
"     colorscheme solarized
"     let g:lightline = {'colorscheme': 'solarized'}
" elseif &t_Co < 256
"     colorscheme default
"     set nocursorline " looks bad in this mode
" else
"     set background=dark
"     let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
"     colorscheme solarized
"     " customized colors
"     highlight SignColumn ctermbg=234
"     highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
"     highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
"     let g:lightline = {'colorscheme': 'dark'}
"     highlight SpellBad cterm=underline
"     " patches
"     highlight CursorLineNr cterm=NONE
" endif

" set term=screen-256color

