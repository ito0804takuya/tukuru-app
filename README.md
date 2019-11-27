## 目次
### アプリの名称
### アプリの概要、目的
### 使い方
### 使用技術
### 実装機能
### DB設計

## アプリの名称
### TUKURU

## アプリの概要、目的
  企業（company）は求人を掲載し、求職者（seeker）は求人を閲覧できるWebアプリケーション。
  ものづくりにおいて加工作業者が減っている現状に対し、何らか貢献したいという思いから作成。

## 使い方
・URL：https://tukuru-app.herokuapp.com/
・テスト用アカウント：
  掲載者（company）用
    * メールアドレス: test1@gmail.com
    * パスワード: abc123
  閲覧者（seeker）用
    * メールアドレス名: test2@gmail.com
    * パスワード: abc123

## 使用技術
### フロント
  Haml
  Scss
  Javascript
### サーバサイド
  Ruby(2.5.1)
  （フレームワーク：Ruby on Rails(5.2.3)）
### インフラ
  DB：PostgreSQL
  サーバー：Heroku
  ストレージ：AWS S3
  バージョン管理：github

## 実装機能
・一覧表示機能
・詳細表示機能
・投稿機能
・編集機能
・削除機能
・ユーザログイン機能（発信者、求職者）
・ユーザログアウト機能（発信者、求職者）
・画像アップロード機能 (AWS S3へファイルを格納)
・ページネーション機能
・単体テスト機能
・DBテーブルのリレーション管理

## DB設計
### companiesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
#### Association
- has_many :jobs


### jobsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|body|string|null: false|
|tel|string|null: false|
|email|string|null: false|
|url|string||
|postal_code|string||
|city|string|null: false|
|block|string|null: false|
|building|string||
|prefecture_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
|company_id|references|null: false, foreign_key: true|
|seeker_id|references|foreign_key: true|
#### Association
- belongs_to :company
- has_many :seekers, throuth: :job_seekers
- has_many :job_seekers
- has_many :images

### imagesテーブル
|column|Type|Option|
|-------|----|-----|
|image|string|null: false|
|job_id|references|null: false, foreign_key: true|
#### Association
- belongs_to :job

### seekersテーブル
|column|Type|Option|
|-------|----|-----|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
#### Association
- has_many :jobs, throuth: :job_seekers
- has_many :job_seekers

### job_seekersテーブル
|Column|Type|Options|
|------|----|-------|
|job|references|null: false, foreign_key: true|
|seeker|references|null: false, foreign_key: true|
#### Association
- belongs_to :job
- belongs_to :seeker

### prefecturesテーブル
|column|Type|Option|
|-------|----|-----|
|name|string|null: false, unique: true|
#### Association
- has_many :jobs