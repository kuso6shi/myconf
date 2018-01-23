set nocompatible "vi互換性を解除
set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
"ファイル・文字コード設定
set fileencoding=utf-8 "ファイル保存時のエンコード設定
set fileformats=unix,mac,dos "改行コードの自動判別
"キー割り当て
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
set t_Co=256 "256食対応

"検索
set hlsearch "検索結果をハイライト
set ignorecase "検索結果の大文字小文字を区別しない
set smartcase

"表示・文字関係
set autoindent "オートインデントの設定
set ruler "カーソルが何行目何列か表示
set number "行番号の表示
set wildmenu "コマンドライン保管が拡張モードで行われる
set showcmd "コマンドを最下行に表示
syntax on "構文ごとに色分け
set list "ラインの終わりを表示
" タブ、行末スペースなどを可視化した時に表示する記号
set listchars=eol:$,tab:>\-,trail:-,extends:>,precedes:<,nbsp:%
" 全角スペースの可視化(行末スペースの可視化と同時に設定できない)
hi ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=white
match ZenkakuSpace /　/
set nowrap "行を折り返さない
set showmatch "対応したカッコをハイライト
set clipboard=unnamed
