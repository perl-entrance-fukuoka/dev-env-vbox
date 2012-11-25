
環境構築手順 - Perl入学式 in 福岡 
==========

( 画面キャプチャ: https://cacoo.com/diagrams/CrhHlSCC7FfQS4b5 )

Perl入学式 in 福岡 での環境構築について
----------
各 OS 毎に環境構築する方法はありますが、
今回は以下の目的のため VirtualBox に Linux (CentOS) を準備し構築します。

- どの OS をご利用のかたも同じ手順をおこなっていただくため
- みなさんのPC環境を極力汚さないようにするため
- 実際にWebのサービスを公開するような場合、
  Linuxサーバを利用することが多いため

VirtualBox のインストール
----------
インストーラーをダウンロード
- https://www.virtualbox.org/wiki/Downloads
- 当日はUSBメモリで配布

インストーラーを起動し、あとは手順にそって行う

Perl入学式用 仮想アプライアンス(イメージ) の読み込みと起動
----------
仮想アプライアンスインポート
- https://dl.dropbox.com/u/1981687/perl-entrance-fukuoka-20121124.ova
- 当日はUSBメモリで配布

設定と起動
----------
* ネットワーク
- NAT および ホストオンリー が有効になっていることを確認

起動

起動後の確認
----------
- ホストオンリーネットワークでの IP アドレスを確認
  
      ifconfig
      # 192.168.33.10

- SSH でログイン
  
      ssh user1@192.168.33.10
      # usestrict

perlbrew のインストール
----------

    curl -kL http://install.perlbrew.pl | bash
    source ~/perl5/perlbrew/etc/bashrc
    echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.bashrc

perlbrew で perl-5.12.5 をインストール
----------

    perlbrew available
    perlbrew -v -n install perl-5.12.5

    perl -v
    which perl

    perlbrew list
    perlbrew use perl-5.12.5
    perl -v
    which perl

cpanm のインストール
----------

    perlbrew install-cpanm

    cpanm --version

Plack のインストール
----------

    cpanm -v Plack
    perldoc Plack
