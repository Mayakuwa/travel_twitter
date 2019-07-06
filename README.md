# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* model（データベースを作成）　→　rails g model モデル名　カラム名：データ型　カラム名：データ型
例）rails g model User name:string tweet:content

*　既存のモデルに変更を加える場合
1. マイグレーションファイルを作成（rails g migration ファイル名 ）
例) rails g migration add_image_name_to_user

2. できたマイグレーションファイルに変更を加える、その後rails db:migrateコマンドで変更内容を反映！！！

*データベースから抜け出す方法（ハマった時）
sqlite> quit
   ...> ;
Error: near "quit": syntax error
sqlite> 
　（;を入力してエンター押す）

* データベースのカラムなど、全体の状態を確認コマンド
rails db:migrate:status

