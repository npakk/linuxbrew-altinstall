# altinstall.rb -- Linuxbrew の自動インストールスクリプトが異常終了する場合の代替インストールスクリプト

## 概要

[Linuxbrew][BREW] とは、 Mac OS X 上における、ソースコードの取得及びビルドに基づいたパッケージ管理システムである [Homebrew][HBRW] を Linux の各ディストリビューション向けに移植したものです。

しかし、 [64 bit ARM アーキテクチャ][ARMP]等の環境で動作する Linux の各ディストリビューションにおいて、 [Linuxbrew 公式ページ][BREW]が公開している [Linuxbrew][BREW] を自動的にインストールするためのスクリプトを起動すると、以下のようなエラーメッセージを出力してスクリプトが異常終了します。

```shell-session
  $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  ...
  Error: Cannot find a vendored version of ruby for your aarch64
  processor on Linuxbrew!
  Error: Failed to install vendor Ruby.
  $
```

```altinstall.rb``` は、 [Linuxbrew 公式ページ][BREW]による [Linuxbrew][BREW] の自動インストールスクリプトについて、 [Linuxbrew][BREW] 本体が使用する ruby 処理系の導入に関する問題を回避するように修正した代替の自動インストールスクリプトです。

なお、 [Linuxbrew][BREW] の自動インストールスクリプトが異常終了する詳細とその回避手法についての詳細は、 "[Linuxbrew の通常のインストール手法が異常終了する場合における代替の導入手法][ZOLQ]" の投稿を御覧下さい。

## 使用法

## 使用条件

<!-- 外部リンク一覧 -->

[HBRW]:http://brew.sh/index_ja.html
[BREW]:http://linuxbrew.sh/
[ARMP]:https://www.arm.com/
[ZOLQ]:https://qiita.com/z80oolong/items/61feb20a9356532a15da
