"Something
cd ~/
syntax on
set nu
set rnu
set autoindent
"set cursorline
set mouse=a
set wildmode=longest,list,full
set guifont=Space\ Mono:h14
set encoding=UTF-8

"Plugin
call plug#begin('~/.config/nvim/plugged')
Plug 'ryanoasis/vim-devicons' "icons
Plug 'kyazdani42/nvim-tree.lua' "file explorer
Plug 'voldikss/vim-floaterm' "terminal
Plug 'chrisbra/colorizer' "color syntax
Plug 'sainnhe/gruvbox-material' "everforest
call plug#end()

set termguicolors
set background=dark
colorscheme gruvbox-material
"hi Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * ColorHighlight

"Keymap
imap qq <Esc>
vmap qq <Esc>
cmap qq <Esc>
tnoremap qq <C-\><C-n>
	let g:floaterm_keymap_toggle = 'fp'
	"let g:floaterm_shell='"\Program Files\Git\bin\bash.exe"'
	let g:floaterm_shell='bash'
	let g:floaterm_wintype='split'
	"let g:floaterm_position='right'
	let g:floaterm_width=0.5
	let g:floaterm_height=0.3
	let g:floaterm_autoinsert='false'
nmap fe :NvimTreeToggle<cr>
nmap <HOME> :Dashboard<cr>
nmap ff :e ~/.config/nvim/init.vim<cr>
nmap fr :source ~/.config/nvim/init.vim<cr>
nmap fn :tabnew<cr>
nmap fq :q<cr>
nmap fw :w<cr>
nmap <C-f> :so $VIMRUNTIME/syntax/hitest.vim<cr>
	"clipboard
	nmap <c-c> "+y
	vmap <c-c> "+y
	nmap <c-v> "+p
	inoremap <c-v> <c-r>+
	cnoremap <c-v> <c-r>+
	inoremap <c-r> <c-v>
	"Window navigation
	nmap vs :vsplit<cr>
	nmap hs :split<cr>
	nmap <TAB> :tabnext<cr>
	nmap <S-TAB> :tabprev<cr>
	nmap <A-w> <C-w>w
	nmap fh <C-w>h
	nmap fj <C-w>j
	nmap fk <C-w>k
	nmap fl <C-w>l

"Statusline
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set noshowcmd
set statusline=
set statusline+=%#Search#                               "Color
set statusline+=\ %{toupper(g:currentmode[mode()])}\   	"The current mode
set statusline+=%#Directory#            		"Color
set statusline+=\ %<%F%m%r%h%w\                    	"File path, modified, readonly, helpfile, preview
set statusline+=%=                                    	"Right Side
set statusline+=%#Pmenu#                                "Color
set statusline+=\ %02v/%02l\                          	"Colomn number

lua require'nvim-tree'.setup {}
