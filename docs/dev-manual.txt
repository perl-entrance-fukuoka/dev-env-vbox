
Vagrant で Base box を作成
----------
- veewee で CentOS-6.3-x86_64-minimal をベースに作成
- https://dl.dropbox.com/u/1981687/CentOS-6.3-x86_64-minimal-ja.box


仮想アプライアンス作成用の VM を Vagrant で起動
----------

    cd vagrant/base
    vagrant up

    # SSH 接続して中身確認
    vagrant ssh
    
    # 停止
    vagrant halt


仮想アプライアンス作成
---------

    # VM は停止した状態で
    VBoxManage export "perl-entrance-fukuoka" \
        --output perl-entrance-fukuoka-$(date +%Y%m%d).ova

各種設定
---------

| account | password  |
|---------|-----------|
|   root  | vagrant   |
|   user1 | usestrict |
|   user2 | usestrict |

( user2 には perlbrew + cpanm + Plack をあらかじめ準備済 )
