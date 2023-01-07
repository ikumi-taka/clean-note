# README
# アプリケーション名
Clean Note

# アプリケーション概要
家電のお手入れ記録を付けることができる。
掃除記録を家族やパートナーと共有し、閲覧することができる。

# URL
https://clean-note.onrender.com

# テスト用アカウント
Name: test-account<br>
Email: test@test<br>
Password: 123456<br>

# 利用方法
1.アカウント新規登録orログインをする<br>
2.掃除記録を作成ボタンからお手入れする家電の情報を入力し、登録をする。<br>
(このときに共有したいメンバーがいる場合、選択をして登録)<br>
3.サイドバーの家電名をクリックすると、記録ページが表示される。<br>
4.記録ページの下部にある入力欄より、記録したいことを入力し送信すると、画面に表示される。<br>
5.掃除機六ページを削除したい場合は、掃除記録を削除をクリックすると削除される。<br>

# アプリケーションを作成した背景
平日は仕事や育児に追われている。掃除をするのは土日が中心。<br>
こまめに掃除ができればいいが、仕事の状況や子どもの体調・行事などを優先するとそうも行かない。<br>
夫婦間で「この掃除いつした？」「加湿器のフィルターいつ交換した？」というやりとりが増えてきた。<br>
我が家は冬場は特に、家族の体調管理に気を遣っているため、加湿器のお手入れ（フィルター掃除や消耗品の取り替え）に力を入れている。<br>
紙のカレンダーに記録してもなかなか振り返ることができない。書くことを忘れる。<br>
そのため、いつ掃除をしたのかスマホでサッと記録・確認できるようにして掃除の計画をスムーズに立てたいと思い作成した。<br>

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1X2rPtoX_PXooqXi414bF87wq0CzMwoMVltkIzj85OI0/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
[![Image from Gyazo](https://i.gyazo.com/557766263d43befe816b33b8a57e5495.png)](https://gyazo.com/557766263d43befe816b33b8a57e5495)
アカウント登録が完了するとマイページに遷移。

[![Image from Gyazo](https://i.gyazo.com/9b0ca4942ad84d9114b9cbdd9eab332f.gif)](https://gyazo.com/9b0ca4942ad84d9114b9cbdd9eab332f)
掃除記録の作成ページに移動し、記録をしたい家電情報を入力する。

[![Image from Gyazo](https://i.gyazo.com/9d1a5ab2d193dfc7a620edca0c357977.gif)](https://gyazo.com/9d1a5ab2d193dfc7a620edca0c357977)
情報入力をしcreateボタンを押すとマイページに戻る。左サイドバーに家電の名前が表示される。

[![Image from Gyazo](https://i.gyazo.com/0e05fb435a09972f8f3ab27e92b7f67f.gif)](https://gyazo.com/0e05fb435a09972f8f3ab27e92b7f67f)
サイドバーから家電の名前をクリックすると、掃除記録をするページがメイン画面に表示される。<br>
メイン画面の上部には、家電情報を登録した内容(家電の写真や名前、型式など)が表示されるようになっている。<br>
ページ下の入力画面より、記録したい事柄「○○を掃除した」「消耗品を交換した」などを入力し送信すると表記される。<br>

# データベース設計(ER図)
[![Image from Gyazo](https://i.gyazo.com/f671cc39c379f89cdf9680b9bcc1485e.png)](https://gyazo.com/f671cc39c379f89cdf9680b9bcc1485e)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/0140c5b2de395a82be593d2ba10acb90.png)](https://gyazo.com/0140c5b2de395a82be593d2ba10acb90)

# ローカルでの動作方法
% git clone https://github.com/ikumi-taka/clean-note.git

% cd clean-note

% bundle install

% yarn install

# 工夫したポイント
開発する事前準備として、テーブル名やカラム名の洗い出しを行なった。<br>
Githubのプロジェクトボードを利用し、作成手順をまとめてから開発した。<br>
登録した家電が一覧でわかるようにサイドバーを設置した。<br>

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |



### Association
- has_many :housework_users
- has_many :houseworks, through: :housework_users
- has_many :records


## houseworksテーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|
| image          | string |             |
| housework_name | string | null: false |
| housework_type | string |             |
| buy_date       | string |             |
| parts_name     | string |             |
| parts_type     | string |             |
| exchange       | string |             |

### Association
- has_many :housework_users
- has_many :users, through: :housework_users
- has_many :records


## housework_usersテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| housework | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :housework

## recordsテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| content   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| housework | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- belongs_to :housework