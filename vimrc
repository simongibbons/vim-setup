"=== META COMMANDS ===
"Clear all auto commands
autocmd!

set nocompatible                  "We don't need vi compatibility
set fileformats=unix,dos,mac      "support all three newline formats
"==================

"=== VIM PLUGINS ===
call pathogen#infect()            "Enable Pathogen Support
filetype plugin on                "Needed for some plugins to work
"==================

"=== CONSOLE UI & TEXT DISPLAY ===
set noerrorbells                  "Stop Annoying Me
set visualbell t_vb=              "Stop Flashing Me

set lazyredraw                    "Don't redraw while in macros
set wrap                          "Softwrap long lines
set textwidth=79                  "Set break for when pasting text
set formatoptions=qrn1            "See :help fo-table for more information
if version >= 703
    set colorcolumn=85            "Column highlight to indicate a too long line
endif
set list                          "Show invisible characters
set listchars=tab:>·,trail:·      "But only show tabs and trailing whitespace

set number                        "Line numbers
if has('cmdline_hist')
    set ruler                     "Show Location on line
    set showcmd                   "Show partial commands in the status line
endif

set cursorline                    "Highlight Current line
syntax enable                     "Enable Syntax Highlighting

if has('gui_running')
    set background=light          "Use a light background in GUI
else
    set background=dark           "Use a dark background on consoles
endif

let g:solarized_termtrans = 1
colorscheme solarized             "Use the solarized colourscheme

if has('cmdline_compl')
    set wildmenu                  "Use menu based command autocompletion
endif

if has('mouse')                   "Enable mouse support if the terminal
    set mouse=a                   "allows it.
endif

set showmatch                     "Show the bracket matching the highlighted one
set scrolloff=3                   "Don't allow me to scroll off the file

if version >= 703
    set undofile                  "Save undo information between edits
    set undodir=$HOME/.vim/undo   "Don't pollute directories with undofiles
    set undolevels=1000           "How Many Undos to keep
    set undoreload=10000          "Number of lines to save for undo
    set relativenumber            "Use relative line numbering
endif

set laststatus=2                  "Always display the status line

au FocusLost * :wa                "Automatically write a file on loss of focus
"==================

"=== KEY MAPPINGS ===
"Remap arrows to force me to use vim properly
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"Edit by screen lines rather than by file lines
nnoremap j gj
nnoremap k gk

"Save my little finger!
nnoremap ; :

"Add shortcuts to tree view and the tagbar
noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :TagbarToggle<CR>

"Map the leader key to something more convienient
let mapleader = ","
"==================

"=== INDENTS AND TABS ===
set autoindent                    "Use same indent as line above
if has('smartindent')
    set smartindent               "Be smart about indenting
endif
set expandtab                     "Expand <TAB> to spaces
set tabstop=4                     "Set tabwidth to four spaces
set shiftwidth=4                  "Set indent width to four spaces
"==================

"=== CODE FOLDING ===
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
"=================

"=== SEARCHING AND MOVING ===
"Fix vim's regex handling
nnoremap / /\v
vnoremap / /\v

set ignorecase                    "Case Sensitive search smartly, ignore
set smartcase                     "case in all lower case searches.

set gdefault                      "Apply substitutions globally on lines

set incsearch                     "Perform search incrimentally
set showmatch                     "and highlight searches as you type
set hlsearch                      "them.

"Use ,<space> to clear out searches.
nnoremap <leader><space> :noh<cr>

"Use <TAB> to match bracketed pairs.
nnoremap <tab> %
vnoremap <tab> %
"==================

"=== FILE SPECIFIC SETTINGS ===

"Makefiles
autocmd FileType make setlocal noexpandtab

"==================
