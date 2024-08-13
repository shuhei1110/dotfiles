# Dotfiles

How to use each tools

## [vim](#vim)

## [tmux](#tmux)

## [bash](#bash)

## [zsh](#zsh)

* * * 

## ><a id="vim"></a>vim

### Install Plugin
Install plugin manager
```
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install plugin with plugin manager
```
$ vim

:PlugInstall
```

### Vim Command

| コマンド      | 説明                                                                                     |
|---------------|-----------------------------|
| :w            | ファイルを保存                                                                             |
| :q            | Vimを終了                                                                                 |
| :q!           | 保存せずに終了                                                                             |
| :qw           | 保存して終了                                                                               |
| gg            | ページトップに移動                                                                         |
| G             | ページ最下部に移動                                                                         |
| w             | 次の単語前に移動                                                                           |
| b             | 前の単語の先頭に移動                                                                       |
| e             | 単語の最後に移動                                                                           |
| t             | 順方向に検索して文字の二つ前に移動                                                         |
| T             | 逆方向に検索して文字の二つ後ろに移動                                                       |
| f             | 順方向に検索して文字の一つ前に移動                                                         |
| F             | 逆方向に検索して文字の一つ後ろに移動                                                       |
| ;             | t,T,f,Fコマンドを順方向に繰り返す                                                          |
| ,             | t,T,f,Fコマンドを逆方向に繰り返す                                                          |
| ctrl + b      | 一画面上に移動                                                                             |
| ctrl + f      | 一画面下に移動                                                                             |
| ctrl + u      | 半画面上に移動                                                                             |
| ctrl + d      | 半画面下に移動                                                                             |
| v             | visualモード                                                                               |
| CRTL-v        | 矩形選択モード                                                                             |
| Shift-i       | 矩形選択モードで選択した複数行同時編集                                                     |
| gj            | 表示されているままに1行下に移動                                                            |
| gk            | 表示されているままに1行上に移動                                                            |
| ^             | 行頭に移動                                                                                 |
| $             | 行末に移動                                                                                 |
| i             | インサートモード                                                                           |
| o             | 改行してインサートモード                                                                   |
| a             | カーソルの後ろからインサートモード                                                         |
| x             | 削除                                                                                       |
| y             | コピー                                                                                     |
| 3yy           | 3行コピー                                                                                  |
| Y             | 1行コピー                                                                                  |
| p             | ペースト                                                                                   |
| Ctrl-p        | 入力補完                                                                                   |
| u             | undo                                                                                       |
| CTRL + r      | redo                                                                                       |
| :tabnew       | 新しいタブを開く                                                                           |
| gt            | タブを移動                                                                                 |
| g Shift+t     | タブを逆方向に移動                                                                         |
| dd            | 1行削除                                                                                    |
| diw           | 単語削除                                                                                   |
| diW           | 文全体を削除                                                                               |
| di)           | )までを削除                                                                                |
| dt)           | カーソルから)までを削除                                                                    |
| :s/hoge/fuga/g| hogeをfugaに変更                                                                           |

### NERDTree Command

 | コマンド             | 説明                           |
 |----------------------|--------------------------------|
 | CTRL + n             | NERDTree起動                   |
 | CTRL + w -> w, hjkl  | 開いたファイルの移動           |
 | o                    | ファイルを開く                 |
 | x                    | ディレクトリを閉じる           |
 | i                    | 垂直分割                       |
 | s                    | 水平分割                       |
 | q                    | 分割したファイルを閉じる       |
 | Shift-i              | 隠しファイルを表示             |
 | m                    | メニューを開く                 |
 | ma                   | 新規ファイル作成               |
 | md                   | ファイル削除                   |
　| r                   | ファイル更新                  |




## ><a id="tmux"></a>tmux

## ><a id="bash"></a>bash

## ><a id="zsh"></a>zsh





