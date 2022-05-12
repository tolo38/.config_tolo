"-------------------------------------------------------------------------------
" Vim configuration (for Linux 256 colors term - Debian package vim-gtk)
"
" SETUP NEEDED
" cp .vimrc ~/.vimrc
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall
"-------------------------------------------------------------------------------
" use vim
set nocompatible
" change leader key
let mapleader=' '
"-------------------------------------------------------------------------------
" Use Vundle to manage plugin

" set the runtime path to include Vundle and initialize
filetype off                  " required
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" Tabular: align text easily
Plugin 'godlygeek/tabular'
" Airline: better status line
Plugin 'bling/vim-airline'
" colorscheme plugin
Plugin 'vim-scripts/wombat256.vim'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'Raimondi/delimitMate'
" YCM
"Plugin 'Valloric/YouCompleteMe'
" NerdTree
Plugin 'scrooloose/nerdtree'
" YCM-Generator
"Plugin 'rdnetto/YCM-Generator'
" syntastic
Plugin 'vim-syntastic/syntastic'
" xml.vim
Plugin 'othree/xml.vim'
" vim-pydocstring
Plugin 'heavenshell/vim-pydocstring'

" denite.vim : Denite is a dark powered plugin for Neovim/Vim to unite all interfaces. It can
" replace many features or plugins with its interface. It is like a fuzzy finder, but is more
" generic. You can extend the interface and create the sources.
"Plugin 'Shougo/denite.nvim'

" Vison is a Vim plugin to help writing *.json file with JSON Schema.
Plugin 'Quramy/vison'


call vundle#end()
filetype plugin indent on    " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" General settings

" automatic plugin + indent + syntax
syntax on

" activate smart completion
set  omnifunc =syntaxcomplete#Complete

" no beep or flashing screen
set noerrorbells
set vb t_vb=

" Indentation intelligents
set smartindent

" Conserve l'indentation courante sur les nouvelles lignes
set autoindent

" Show starting tabs
"set listchars=tab:┊›

" incremental highlighted search with smartcase
set incsearch
set hlsearch
" ignore la casse lors de la recherche
set ignorecase
set smartcase

" status line for all windows
set laststatus=2

" affiche les commandes incomplète
set showcmd

" Souligne la ligne courante
set cursorline

" Affiche les numéros de lignes
set number

" show matching elements (brackets, ...)
set showmatch

" when scrolling, leave X lines before and after cursor
set scrolloff=5

" terminal settings - performance and 256 colors
set ttyfast
set t_Co=256
" disable background erase to allow colors to be correct in tmux
set t_ut=

" correct settings for backspace key
set backspace=2
" retours arrières intelligents
set backspace=indent,eol,start

" activate wildmenu for nice autocomplete in commands
set wildmenu
set wildmode=longest,full

" format to 98 chars, using tabs of size 4
set textwidth=98
set colorcolumn=+1
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Conversion des tabulations en espaces
set expandtab
" respect textwidth
autocmd Filetype * set formatoptions+=t

" use system clipboard (copy/paste inside outside vim)
set clipboard=unnamedplus

" activate macros
runtime macros/matchit.vim

" bigger history
set history=10000

" Automatic toggling between line number modes
"set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

"-------------------------------------------------------------------------------
" General mappings

" format text paragraph
"nmap <C-i> mn{v}gq'n

" remove all bad leading/trailing whitespace
nmap <C-d> :%s/\s\+$/<CR>

"Ctrl-b aller au tampon suivant (:help map)
nmap <C-b> :bNext<CR>
"Ctrl-b aller au tampon suivant (:help map)
"map <C-S-b> :bprevious<CR>

"Ctrl-m maximize la fenetre courrante (:help map)
map <C-m> :resize<CR>

"Ctrl-m maximize la fenetre courrante (:help map)
map <C-t> :tabnew<CR>

" smart completion
imap  <C-Space> <C-X><C-O>

"Store session
nmap <F7> :mksession! ~/.vim/sessions/vim_session <cr>
"Load session
nmap <F8> :source  ~/.vim/sessions/vim_session <cr>

"-------------------------------------------------------------------------------
" General abbreviations (iab stands for iabbrev)

iab #i #include
iab #d #define
iab slef self
iab s. self.

command B exe "buffers"

"----------------------------------------------------------------------------
" Plugins config

" set color
colorscheme wombat256mod
" fix color for column highlight
hi ColorColumn ctermbg=236 cterm=none guibg=#32322f

" NERDTree
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :tabprevious<CR>
nnoremap <F4> :tabnext<CR>

" Spell checking
" To get french dictionaries
" wget http://ftp.vim.org/vim/runtime/spell/fr.{latin1,utf-8}.s{pl,ug} -P ~/.vim/spell/

" Commands :
" z= sur un mot souligné affiche une liste de corrections possibles
" zg rajoute un mot dans le dictionnaire
" zug pour annuler l'ajout au dictionnaire
" ]s pour aller au prochain mot mal orthographié
" [s pour le précédent
map <C-S-Right> ]s
map <C-S-Left> [s

" F3 will find the previous occurrence after vimgrep
map <F3> :cp!<CR>
" F4 will find the next occurrence after vimgrep
map <F4> :cn!<CR>
" F9 search for word under the cursor recursively , :copen , to close -> :ccl
nnoremap <F9> :grep! "\<<cword>\>" . -r<CR>:copen 33<CR>

" F12 activates and de-activates spell checking in english
map <F12> "<Esc>:silent setlocal spell! spelllang=en<CR>"
" Shift-F12 activates and de-activates spell checking in french
map <S-F12> "<Esc>:silent setlocal spell! spelllang=fr<CR>"

" Activate spell checking for all *.txt and *.tex files
autocmd BufEnter *.{txt,tex} set spell

" On saving any file, remove all bad leading/trailing whitespace
autocmd BufWritePost * :silent! %s/\s\+$//

" Supertab
let g:SuperTabDefaultCompletionType = "context"

" Airline
" trailing whitespace tweak
let g:airline#extensions#whitespace#mixed_indent_algo=1
" customize number of lines (percentage/line/number of lines/col)
let g:airline_section_z = '%p%% %l/%L %c'

" Désactive la compatibilité avec vi
set nocompatible

" Active la coloration syntaxique
syntax on

" Indentation a la marque de Tab la plus proche
set shiftround

" affiche le mode d'édition
set showmode

" affiche la position du curseur
set ruler

"active l'utilisation de la souris dans le terminal
" set mouse=a


" Header insertion
"autocmd bufnewfile *.{c,cpp,h,hpp} so /home/ogmay/.vim/header.txt
"autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.{c,cpp,h,hpp} execute "normal ma"
"autocmd Bufwritepre,filewritepre *.{c,cpp,h,hpp} exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
"autocmd Bufwritepost,filewritepost *.{c,cpp,h,hpp} execute "normal `a"`"

"------------------------------------------
"DelimitMate Customization

"Turns on/off the expansion of <CR>.
let delimitMate_expand_cr = 1

"This option turns on/off the expansion of <Space>. Read |delimitMateExpansion|
"for details.
let delimitMate_expand_space = 1

"Turns on/off jumping over expansions.
let delimitMate_jump_expansion = 1

"------------------------------------------

" Use <leader>p to open ctrlp
let g:ctrlp_map = '<leader>p'

" Default working path
let g:ctrlp_working_path_mode = 'ra'

" Ignore these directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" disable caching
let g:ctrlp_use_caching=0
"------------------------------------------
"       CTRLP Customization

set runtimepath^=~/.vim/bundle/ctrlp.vim

"------------------------------------------
" vim-ros
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }

" Ros syntax for launch files
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

if exists("b:current_syntax")
  finish
endif

runtime syntax/xml.vim

let s:current_syntax=b:current_syntax
unlet b:current_syntax

syntax include @YAML syntax/yaml.vim
syntax region ymlSnipInline matchgroup=rosparamTag start="\m<.\{-}rosparam.\{-}>" end="\m</.\{-}rosparam.\{-}>" contains=@YAML containedin=xmlEntity
hi link rosparamTag ModeMsg

let b:current_syntax=s:current_syntax

" Ros indent for launch files
" Use XML indentation rules

if exists("b:did_indent")
  finish
endif

" load the XML indent rules
runtime! indent/xml.vim
runtime! indent/yaml.vim

" override the vim indent expression (we'll call it ourselves)
setlocal indentexpr=GetRoslaunchIndent(v:lnum)

" Only define the function once.
if exists("*GetRoslaunchIndent")
  finish
endif

" wiki-indent will return vim indent inside a <pre> block,
" and return -1 if not inside a block to trigger auto-indent
function GetRoslaunchIndent(lnum)
  return -1
  if searchpair('<rosparam>','','</rosparam>','bWnm') > 0
    return GetYAMLIndent(lnum)
  else
    return -1
  endif
endfunc

"------------------------------------------
" syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:xml_syntax_folding = 1
"set foldmethod=syntax

" remove unwanted error messages
let g:syntastic_quiet_messages = { "regex": [
        \ 'possible unwanted space at "{"',
        \ 'double space at "*"',
			  \ 'Wrong length of dash may have been used',
        \ 'SOME OTHER SYNTASTIC MESSAGE',
\ ] }

"------------------------------------------
" vim-pydocstring

"Ctrl-l generates docstring
silent map <C-l> <Plug>(pydocstring)

"----------------------------------- SPEAG -------------------------------------

" Cursor Color And Shape
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar

" REMAP:
" jk for normal mode
:imap jk <Esc>
" "" for surround with quote
:nmap "" ciw""jkP
:nmap "' ciw''jkP


" configurations found at : [youtube](https://www.youtube.com/watch?v=XA2WjJbmmoM)

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)


