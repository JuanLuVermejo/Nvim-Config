
set number
set title
set mouse=a

set nowrap

set cursorline " Resalta la linea actual
set colorcolumn=120 " Nuestra linea limite mide 120 caracteres

" Indentacion a 2 espacios
"  set tabstop=2
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


set termguicolors " Activa true colors en terminal
set background=dark

call plug#begin(stdpath('data') . '/plugged')

Plug 'patstockwell/vim-monokai-tasty'

Plug 'drewtempelmeyer/palenight.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine'

"autocompletado
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'ervandew/supertab'

"Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

"Comillas
Plug 'tpope/vim-surround'
"Inserta pares de comillas y parentesis
Plug 'jiangmiao/auto-pairs'

call plug#end()

" tema

let g:lightline = { 'colorscheme': 'palenight' }
let g:lightline = { 'colorscheme': 'palenight' }

"barra de estado"

let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

"guia de indentación

" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"Configración de Autocompletado

" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'

"Configuración de snippets

" Expandir snippet con Ctrl + j
let g:UltiSnipsExpandTrigger = '<c-j>'

" Ir a siguiente ubicacion con Ctrl + j
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
" Ir a anterior ubicacion con Ctrl + k
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

colorscheme palenight

#MONOKAI TASTY

#colorscheme vim-monokai-tasty
#let g:vim_monokai_tasty_italic = 1
#colorscheme vim-monokai-tasty
#let g:lightline = {
#    \ 'colorscheme': 'monokai_tasty',
#    \ }

" ale 
let g:ale_linters = { 
\  'python': ['flake8','pydocstyle','bandit','mypy'],
\}
let g:ale_fixers = {
\  '*': [], 
\  'python': ['black', 'isort'],
\  'javascript': ['prettier'],
\  'css': ['prettier'],
\}

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1


lua <<EOF
require('bufferline').setup {
 options = {
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = 'coc',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 29,
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}
EOF
