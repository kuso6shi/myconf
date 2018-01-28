set nocompatible "vi互換性を解除
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
"ファイル・文字コード設定
set fileencoding=utf-8 "ファイル保存時のエンコード設定
set fileformats=unix,mac,dos "改行コードの自動判別
"キー割り当て
""キーマッピング
let mapleader=","
"nnoremap :ddtree<CR> :NERDTreeToggle<CR>
inoremap <c-e> <Esc>
"Escをjjに変更
inoremap jj <Esc>
":をjに変更
noremap <Space>j :
"NERDTreeをスペース+tで起動
nnoremap <Space>t :NERDTree<CR>
"ハイライトを消すをEsc２回連打に変更
nmap <silent> <Esc><Esc> :nohlsearch<CR>
"括弧の補完
"プラグインで導入
"inoremap {<CR> {}<Left><CR><ESC><S-o>
"inoremap [<CR> []<Left><CR><ESC><S-o>
"inoremap (<CR> ()<Left><CR><ESC><S-o>
""tabキーの設定
set expandtab "tabキーをspaceに変更
set tabstop=4 "既存のファイルのtabキーを置き換える空白数
set smarttab "行の始めのtabキーを押すとshiftwidthだけインデント
set shiftwidth=4 "vimのシステムや>>で入力されるインデントの空白数
set softtabstop=4 "tabキーで入力される空白の数
""backspaceの割当
set backspace=indent,eol,start

"システム関係
set updatetime=0 "swap作成までの時間
set whichwrap=b,s,h,l,<,>,[,] "行をまたいで移動可能
"set t_Co=256 "256食対応
"検索
set hlsearch "検索結果をハイライト
set ignorecase "検索結果の大文字小文字を区別しない
set smartcase
syntax on 
"表示・文字関係
colorscheme molokai
set autoindent "オートインデントの設定
set ruler "カーソルが何行目何列か表示
set number "行番号の表示
set cursorline "カーソルがあるラインをハイライト
set wildmenu "コマンドライン保管が拡張モードで行われる :で探し始める
set history=5000 "保存するコマンド履歴数
set showcmd "コマンドを最下行に表示
set showmode "現在のモードを表示
set statusline+=%<%F
set laststatus=2 "ステータスラインを常に表示
filetype plugin on
filetype indent on
set list "ラインの終わりを表示
" タブ、行末スペースなどを可視化した時に表示する記号
set listchars=eol:$,tab:>\-,trail:-,extends:>,precedes:<,nbsp:%
" 全角スペースの可視化(行末スペースの可視化と同時に設定できない)
hi ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=white
match ZenkakuSpace /　/
set nowrap "行を折り返さない
set showmatch "対応したカッコをハイライト
source $VIMRUNTIME/macros/matchit.vim "vimの%を拡張
set clipboard=unnamed

"クリップボードから貼り付けで自動インデント無効
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


"""""""""""""""""""""""""""""""""""
"color schemeのためのreset augroup"
"""""""""""""""""""""""""""""""""""
"augroup MyAutoCmd
"autocmd!
"augroup END

""""""""""""""""""""""""
"deinの自動インストール"
""""""""""""""""""""""""
"事前に以下を実行する
"$ mkdir -p  ~/.vim/dein
"cd ~/.vim/dein
"$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
"$ sh ./installer.sh ~/.vim/dein
"
let s:dein_dir=expand('~/.vim/dein')
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible               " Be iMproved
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

" Required:
execute 'set runtimepath^=' . s:dein_repo_dir

" Required:
call dein#begin(s:dein_dir)

" Let dein manage dein
" Required:
"call dein#add('Shougo/dein.vim')

let g:rc_dir = expand('~/.vim/rc')
let s:toml = g:rc_dir . '/dein.toml'
let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})
" Add or remove your plugins here:

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()
call dein#save_state()
" Required:
filetype plugin indent on
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
""""""""""""""""""
"Deinの設定終わり"
""""""""""""""""""
