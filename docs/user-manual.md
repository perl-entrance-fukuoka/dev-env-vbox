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
- https://dl.dropbox.com/u/1981687/perl-entrance-fukuoka-20121208.ova
- 当日はUSBメモリで配布

設定と起動
----------
- ネットワーク設定確認
  ( NAT および ホストオンリー が有効になっていること )
　(※アダプターの割り振りふったアドレスが違う場合は設定変更)

- 起動

起動後の確認
----------
- ホストオンリーネットワークでの IP アドレスを確認 ( 192.168.33.10 )

    ifconfig  
    
- SSH でログイン ( usestrict )

    ssh student@192.168.33.10


現在のperlのヴァージョン確認
----------
    perl -v
    which perl

perlbrew のインストール
----------
    curl -kL http://install.perlbrew.pl | bash
    source ~/perl5/perlbrew/etc/bashrc
    echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.bashrc

perlbrew で perl-5.16.2 をインストール
----------

    perlbrew available
    perlbrew -v -n install perl-5.16.2


    perlbrew list
    perlbrew switch perl-5.16.2
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
