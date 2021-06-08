# Nekostagram

# 概要
ねこ特化型写真SNSアプリです。
ねこ写真の投稿・閲覧・いいね、気に入ったねこのフォローができます。

# 本番環境
http://nekostagram.herokuapp.com

## Basic認証
+ ユーザー名：admin
+ パスワード：123456

## ログイン情報（テスト用）
+ Eメール：test1@test.com
+ パスワード：test123

# 制作背景（意図）
「推しねこの最新情報を逃したくない！
でも、TwitterやInstagramだと、ねこ以外の情報が多くて、ねこに集中できない……。」
そんな悩みを解決するために、ねこだけに集中できる、ねこ特化型アプリを開発しました。
お気に入りのねこの新着写真を逃さないためにフォロー機能を実装。
いいね機能で後からお気に入りの写真を見返すことも可能です。

# DEMO
## トップページ
![](https://i.gyazo.com/f2cd7b19ed7baa44c75d2704e584497f.jpg)

## 新規ユーザー登録ページ
![](https://i.gyazo.com/6a66c7e64f10b097b609a2f2022f971c.png)

## マイページ
![](https://i.gyazo.com/8736e44f23d409475184826fcf5faae1.jpg)

## ねこ詳細ページ
![](https://i.gyazo.com/90b33fc8ae28bde263e03b87ea304196.png)

## 新規写真投稿ページ
![](https://i.gyazo.com/588083b32c9fd0e3bdf46d6ef4fa85b8.png)

## 写真詳細ページ
![](https://i.gyazo.com/d79af5f66d63fdaeb2c2b55e1ed8a301.jpg)

## フォロー一覧ページ
![](https://i.gyazo.com/731e1e89d64eadc9fd881092d6ca8ec4.png)

## いいね一覧ページ
![](https://i.gyazo.com/86d137b9ee6feecb604bb3e39065a3f3.jpg)

# 工夫したポイント
+ 多頭飼いに対応するため、catとphotoのアソシエーションを多対多にすることにより、一枚の写真で複数のねこの選択を可能にしました。
+ 読み込みスピードアップのため、ページネーションを導入し、一ページに表示される写真の数を制限しました。
+ スマホ・タブレットでの快適な利用のため、レスポンシブ対応しました。
+ よりスムーズなユーザー体験のため、非同期いいね機能を実装しました。

# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rails
## フロントエンド
Html, Sass, Javascript, JQuery, Ajax
## データベース
MySQL, SequelPro
## インフラ
AWS
## サーバー（本番環境）
Heroku
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode

# 課題や今後実装したい機能
+ 野良猫対応
+ 検索機能

# DB設計
## usersテーブル
|Column             |Type   |Options     |
|-------------------|-------|------------|
|email              |string |null: false |
|encrypted_password |string |null: false |
|user_name          |string |null: false |
|user_profile       |text   |            |

## catsテーブル
|Column       |Type      |Options                      |
|-------------|----------|-----------------------------|
|cat_name     |string    |null: false                  |
|cat_sex_id   |integer   |                             |
|cat_age      |integer   |                             |
|cat_breed_id |integer   |                             |
|user         |reference |null:false, foreign_key:true |

## photosテーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|detail |text      |                              |
|user   |reference |null:false, foreign_key: true |

## cat_photosテーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|cat    |reference |null:false, foreign_key: true |
|photo  |reference |null:false, foreign_key: true |

## likesテーブル
|Column |Type      |Options                       |
|-------|----------|------------------------------|
|user   |reference |null:false, foreign_key: true |
|photo  |reference |null:false, foreign_key: true |

## relationshipsテーブル
|Column |Type      |Options           |
|-------|----------|------------------|
|user   |reference |foreign_key: true |
|cat    |reference |foreign_key: true |

