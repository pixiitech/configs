syntax on
filetype plugin on
filetype indent on
:map! jk <ESC>
:map! <F5> :ls<cr>
cabbrev nt NERDTree
cabbrev ct ConqueTerm bash
cabbrev cts ConqueTermSplit bash
cabbrev ctv ConqueTermVSplit bash
cabbrev ctr ConqueTerm rails c
cabbrev ea EasyAlign
cabbrev hidesigns sign unplace *
cabbrev vrc e ~/.vimrc
cabbrev Wq wq
set ruler
set number
set splitright splitbelow
set expandtab shiftwidth=2 tabstop=2 softtabstop=2
set backspace=indent,eol,start
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
set nofoldenable
set re=0 "use old regex syntax https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
" set clipboard=unnamedplus "https://stackoverflow.com/questions/21810344/how-to-copy-something-from-vim-editor-to-shell-command-line
" autocmd BufWritePre * %s/\s\+$//e
:set ignorecase
set mouse+=a
" set completefunc=syntaxcomplete#Complete
let g:rspec_command = "!bundle exec rspec {spec}"

function! OpenCurrentWithExt(ext)
  execute "e ".expand("%:h")."/".split(expand("%:t"), "\\.")[0].a:ext
endfunction

function! RunSpecsInCurrent()
  if expand("%:f")[strlen(expand("%:f"))-13:strlen(expand("%:f"))] == 'unit.spec.jsx'
    execute "! npm test %"
  elseif expand("%:f")[strlen(expand("%:f"))-8:strlen(expand("%:f"))] == '_spec.rb'
    call RunCurrentSpecFile()
  else
    execute "! yarn cy:run --spec % --headed"
  end
endfunction
" RSpec.vim mappings

map <Leader>t :call RunSpecsInCurrent()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" map <Leader>m :! bundle exec rails test %<CR>
map cp :setlocal nonumber<CR> :sign unplace *<CR>
map <Leader>e :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>
" map <Leader>j :%!python -m json.tool
map <Leader>r :! rubocop %<CR>
map <Leader>y :! yarn eslint %<CR>

map <Leader>h :! yarn cy:run --spec % --browser firefox<CR>
map <Leader>g :! git add %<CR>
map <Leader>i :call OpenCurrentWithExt(".scss")<CR>
map <Leader>j :call OpenCurrentWithExt(".jsx")<CR>
if getcwd() == '/Users/gregory/Projects/vets-api'
  map <Leader>f :e modules/accredited_representative_portal/
elseif getcwd() == '/Users/gregory/Projects/vets-website'
  map <Leader>f :e src/applications/accredited-representative-portal/
end
map <Leader>c :e modules/accredited_representative_portal/app/controllers/accredited_representative_portal/v0/
map <Leader>m :e modules/accredited_representative_portal/app/models/accredited_representative_portal/
map <Leader>v :e spec/support/vcr_cassettes/lighthouse/benefits_claims/
map <Leader>u :e src/applications/representative-form-upload/

" nmap <Leader>c "+yy
vmap <Leader>c "+y
" nmap <Leader>v "+p
" nmap <C-c> "+yy
" vmap <C-c> "+y
" nmap <C-v> "+p
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
autocmd QuickFixCmdPost *grep* cwindow
function SwitchBuffer()
 b#
endfunction
nmap <Tab> :call SwitchBuffer()<CR>
:command Smash :'<,'>s/^/*<Space>/g 
:command Frt :normal gg O# frozen_string_literal: true<CR><ESC>x
:command -nargs=+ Ecomponent :e app/javascript/components/<args>/<args>.jsx
:map <Space>frt :Frt
"=============== Vundle, start ===============

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set path+=~/Projects/vets-api/modules/accredited_representative_portal
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-cucumber'
Plugin 'scrooloose/nerdtree.git'
Plugin 'thoughtbot/vim-rspec'
Plugin 'wkentaro/conque.vim'
" Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/dbext.vim'
Plugin 'leafOfTree/vim-vue-plugin'
" Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/vim-easy-align'
Plugin 'rhysd/vim-fixjson'
" Plugin 'w0rp/ale'
" Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plugin 'junegunn/fzf.vim'
Plugin 'dracula/vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jparise/vim-graphql'
Plugin 'junegunn/vim-emoji'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'crusoexia/vim-monokai'
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'leafgarland/typescript-vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'tpope/vim-commentary'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"=============== Vundle, end ===============
"" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" Dracula must be set after plugin install
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

let g:ycm_auto_hover = ''
if getcwd() == '/Users/gregory/Projects/vets-api'
  :color dracula
elseif getcwd() == '/Users/gregory/Projects/vets-website'
  :color sonokai
else
  :color sonokai
endif
