# altinstall.rb -- Linuxbrew の自動インストールスクリプトが異常終了する場合の代替インストールスクリプト

## 概要

[Linuxbrew][BREW] とは、 Mac OS X 上における、ソースコードの取得及びビルドに基づいたパッケージ管理システムである [Homebrew][HBRW] を Linux の各ディストリビューション向けに移植したものです。

しかし、 [64 bit ARM アーキテクチャ][ARMP]等の環境で動作する Linux の各ディストリビューションにおいて、 [Linuxbrew 公式ページ][BREW]が公開している [Linuxbrew を自動的にインストールするためのスクリプト][BRIN]を起動すると、以下のようなエラーメッセージを出力してスクリプトが異常終了します。

```
  $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  ...
  Error: Cannot find a vendored version of ruby for your aarch64
  processor on Linuxbrew!
  Error: Failed to install vendor Ruby.
  $
```

```altinstall.rb``` は、 [Linuxbrew 公式ページ][BREW]による [Linuxbrew の自動インストールスクリプト][BRIN]について、 [Linuxbrew][BREW] 本体が使用する ruby 処理系の導入に関する問題を回避するように修正した代替の自動インストールスクリプトです。

なお、 [Linuxbrew の自動インストールスクリプト][BRIN]が異常終了する詳細とその回避手法についての詳細は、 "[Linuxbrew の通常のインストール手法が異常終了する場合における代替の導入手法][ZOLQ]" の投稿を御覧下さい。

## 使用法

Linuxbrew の自動インストールスクリプト ```altinstall.rb``` の起動方法は、 [Linuxbrew 公式ページ][BREW]による [Linuxbrew][BREW] のインストールスクリプトの起動方法とほぼ同じですが、 ```altinstall.rb``` の起動前に、 [Linuxbrew][BREW] に依存するシステムのパッケージの他に、 ```libssl-dev, readline, libyaml, libgdbm-dev``` をインストールする必要が有ります。

例えば、 Debian 系のディストリビューションの場合は、以下のようにしてパッケージをインストールします。

```
 $ sudo apt-get install build-essential curl file git python-setuptools ruby
 $ sudo apt-get install libssl-dev libreadline6-dev libyaml-dev libgdbm-dev libdb-dev
```

次に、 [Linuxbrew 公式ページ][BREW]による [Linuxbrew の自動インストールスクリプト][BRIN]の起動方法に代えて、以下のコマンドを実行して [Linuxbrew][BREW] を導入します。

```
 $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/z80oolong/linuxbrew-altinstall/master/install.sh)"
```

## 謝辞

まず最初に、 [Linuxbrew の自動インストールスクリプト][BRIN]の修正に当たって、 [Linuxbrew][BREW] 全体の開発を行っている [Shaun Jackman 氏][SHAU]を始めとする [Linuxbrew][BREW] の開発コミュニティ及び [Homebrew][HBRW] 開発コミュニティの各氏に心より感謝致します。

また、 [Linuxbrew][BREW] の詳細に関しては、 [Linuxbrew 公式ページ][BREW]及び [Linuxbrew][BREW] のリポジトリに含まれるソースコード及びリポジトリに同梱される各種資料も併せて参考にしました。

そして、当方の手元の環境への [Linuxbrew][BREW] の導入の詳細に関しては、 [thermes 氏][THER]による "[Linuxbrew のススメ][THBR]" の投稿を大いに参考にしました。 [thermes 氏][THER]に心より感謝致します。

最後に、 [Linuxbrew][BREW] の全ての事に関わる全ての皆様に心より感謝致します。

## 使用条件

本スクリプトは、 [Linuxbrew][BREW] 及び [Homebrew][HBRW] の開発コミュニティによって作成された [Linuxbrew の自動インストールスクリプト][BRIN]を修正したものであり、 [Linuxbrew][BREW] と [Homebrew][HBRW] の開発コミュニティ及び [Z.OOL. (mailto:zool@zool.jpn.org)][ZOOL] が著作権を有します。

従って、本スクリプトは [Linuxbrew][BREW] 及び [Homebrew][HBRW] のライセンスと同様である [BSD 2-Clause License][BSD2] に基づいて配布されるものとします。詳細については、本リポジトリに同梱する ```LICENSE``` 及び [Linuxbrew の自動インストールスクリプト][BRIN]の ```LICENSE.txt``` の原文である ```doc/LICENSE.txt``` を参照して下さい。

## 追記

下記に、 [Linuxbrew][BREW] 及び [Homebrew][HBRW] の開発コミュニティによって作成された [Linuxbrew の自動インストールスクリプト][BRIN]の README.md の原文を示します。

----

# Linuxbrew (un)installer

[![Build Status](https://travis-ci.org/Linuxbrew/install.svg?branch=master)](https://travis-ci.org/Linuxbrew/install)

## Install Linuxbrew
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

More installation information and options at https://docs.brew.sh/Homebrew-on-Linux#install

## Uninstall Linuxbrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/uninstall)"
```

Download the uninstall script and run `./uninstall --help` to view more uninstall options.

<!-- 外部リンク一覧 -->

[HBRW]:http://brew.sh/index_ja.html
[BREW]:http://linuxbrew.sh/
[BRIN]:https://github.com/Linuxbrew/install
[ARMP]:https://www.arm.com/
[ZOLQ]:https://qiita.com/z80oolong/items/61feb20a9356532a15da
[SHAU]:http://sjackman.ca/
[THER]:https://qiita.com/thermes
[THBR]:https://qiita.com/thermes/items/926b478ff6e3758ecfea
[BSD2]:https://opensource.org/licenses/BSD-2-Clause
[ZOOL]:http://zool.jpn.org/
