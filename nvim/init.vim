" ethan gallucci nvim plugins,
" configs, and remappings

call plug#begin()

Plug 'nvim-treesitter/playground'
Plug 'mhinz/vim-startify'
Plug 'stevearc/dressing.nvim'
Plug 'itchyny/lightline.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'liuchengxu/vista.vim'
Plug 'tmsvg/pear-tree'
Plug 'akinsho/toggleterm.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'sainnhe/artify.vim'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

Plug 'ryanoasis/vim-devicons'
Plug 'chaoren/vim-wordmotion'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'

Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'josa42/vim-lightline-coc'
Plug 'bluz71/vim-moonfly-colors'
Plug 'rust-lang/rust.vim'
Plug 'jaredgorski/spacecamp'
Plug 'folke/twilight.nvim'
Plug 'dracula/vim'
Plug 'lu-ren/SerialExperimentsLain'

call plug#end()


set termguicolors
let g:tokyonight_style = 'night'
set background=dark
colorscheme SerialExperimentsLain

" ## Nvim-Tree
"
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
      \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

let g:nvim_tree_icons = {
      \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
      \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
      \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }


lua << EOF
require('nvim-tree').setup()
EOF

" ## Settings
"
set encoding=UTF-8
set title
set mouse=a
set updatetime=100
set noshowmode
set pumblend=30
set noswapfile
set scrolloff=3
set diffopt+=vertical

set nowrap
set number
set cursorline
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=3
set foldlevel=1
set tabstop=4
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

function! NearestMethodOrFunction() abort
	return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {
\	'colorscheme': 'dracula',
\	'active': {
\		'left': [ [ 'mode', 'paste' ],
\			  [ 'readonly', 'filename', 'modified', 'method'] ]
\	},
\	'component_function': {
\		'method': 'NearestMethodOrFunction'
\	},
\}

" ## Re-mappings
nnoremap T :NvimTreeToggle
nnoremap A :vsplit
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap G :Gsplit
nnoremap M :Vista coc
