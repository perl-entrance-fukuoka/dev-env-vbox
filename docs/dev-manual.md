
Vagrant で Base box を作成
----------
- veewee で CentOS-6.3-i386-minimal をベースに作成
- https://dl.dropbox.com/u/1981687/CentOS-6.3-i386-minimal-ja.box


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

    # 停止
    vagrant halt
    
    # vagrant が利用する共有フォルダ削除
    VBoxManage sharedfolder remove "perl-entrance-fukuoka" \
        --name "v-root"
    VBoxManage sharedfolder remove "perl-entrance-fukuoka" \
        --name "v-csc-1"
    
    # VM は停止した状態で
    VBoxManage export "perl-entrance-fukuoka" \
        --output perl-entrance-fukuoka-$(date +%Y%m%d).ova

各種設定
---------

| account  | password  |
|----------|-----------|
|   root   | vagrant   |
| student  | usestrict |
| student2 | usestrict |

( student2 には perlbrew + cpanm + Plack をあらかじめ準備済 )
