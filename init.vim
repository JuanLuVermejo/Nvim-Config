set number
set rnu
set numberwidth=1
" set title
set mouse=a

set nowrap
set noswapfile
set nobackup

set encoding=utf-8

set cursorline " Resalta la linea actual
set colorcolumn=120 " Nuestra linea limite mide 120 caracteres

" Indentacion a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab "Insertar espacios en vez de <Tab>s

set hidden "Permite cambiar de buffers sin tener que cambiarlos

set ignorecase " Ignorar mayus al hacer una busqueda
set smartcase " No ignorar mayus si la palabra a buscar tiene unas

" set spellang=en,es " Corregir palabras usando diccionarios ingles y español

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

set clipboard+=unnamedplus

set termguicolors " Activa true colors en terminal
set background=dark

call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'

"Barra de estado
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline

"Guías de indentación
Plug 'Yggdroot/indentLine'

"Autocompletado
"Plug 'Shougo/
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado


"Supertab
Plug 'ervandew/supertab'

"Echodoc Mostrar la firma de la función
Plug 'Shougo/echodoc.vim'

"Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

"Parentesis
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Git Integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Visual
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'

" Funcionalidad
Plug 'preservim/nerdcommenter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kyazdani42/nvim-web-devicons'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'akinsho/bufferline.nvim'

Plug 'Markhng/lingo.vim'

call plug#end()

" Keyboard Shortcuts

let mapleader = " "

nnoremap <leader>be <nop>

nnoremap <leader>w :w<CR>
nnoremap <leader><Left>  :vertical resize +5<CR>
nnoremap <leader><Right>  :vertical resize -5<CR>
nnoremap <leader><Up>   :resize -5<CR>
nnoremap <leader><Down>   :resize +5<CR>

" Moverse al siguiente buffer con <lider> + <up>
nnoremap <leader>l :bnext<Return>
nnoremap <leader>h :bprev<Return>
nnoremap <leader>e :bdelete<CR>
"Crear una pestaña nueva con <lider> + t
nnoremap <leader>t :tabe<CR>
nnoremap <leader>bb :NERDTreeToggle<CR>
"Salir de nvim con <lider> + e
nnoremap <leader>q :q<CR>

" Duplicar linea
nnoremap <leader>x :t. <CR>

nnoremap <F5> :!python "%:p"<cr>
nnoremap <F6> :!python "%:p" -v<cr>
nnoremap <leader>u :!xdg-open "%:p"<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

map <leader>ml <C-w><Right>
map <leader>mh <C-w><Left>

let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

let bufferline.icons = v:true
let bufferline.closable = v:true
" If true, new buffers will be inserted at the end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 10


" Signify
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gj
nmap <leader>gK 9999<leader>gk

map <S-Down> <C-E>
map <S-Up> <C-Y>

" Configuración barra de estado
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
"let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

"Configuración de Guías de indentación
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Configuración del autocompletado

" Activar deoplete al iniciar Neovim
"let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
"augroup deopleteCompleteDoneAu
  "autocmd!
  "autocmd CompleteDone * silent! pclose!
"augroup END

"Configuración de Supertab
" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'

" Configuración de Echodoc
set noshowmode  " No mostrar el modo actual (echodoc hace uso de este espacio)

" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1

 "Configuración de Snippets
 "Expandir snippet con Ctrl + j
let g:UltiSnipsExpandTrigger = '<c-j>'

 "Ir a siguiente ubicacion con Ctrl + j
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
 "Ir a anterior ubicacion con Ctrl + k
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" tema

set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

let g:palenight_color_overrides = {
\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
\}

let g:airline#extensions#ale#enabled = 1

let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

"coc config
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\]

" ale 
"let g:ale_linters = { 
"\  'python': ['flake8','pydocstyle','bandit','mypy'],
"\}
"let g:ale_fixers = {
"\  'python': ['black', 'isort'],
"\}

"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '⚠'

"let g:ale_linters_explicit = 1
"let g:ale_fix_on_save = 1

lua <<EOF

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "  ❯",
    file_ignore_patterns = {".git/*","node_modules","env/*"},
    selection_caret = "  ❯",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
require('bufferline').setup {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 20 } },
      buffer_close_icon = "",
      modified_icon = "",
      -- close_icon = "%@NvChad_bufferline_quitvim@%X",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = 'coc',
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            else
               return true
            end
         else
            return true
         end
      end,
      enforce_regular_tabs = true,
      always_show_bufferline = true,
  },
}
EOF

