# README

# 名前
orthopics

## 概要
歯科矯正専用の掲示板アプリ
Orthodontics（歯科矯正） ＋ Picture（写真）

## 作成の背景
現職では、ヘルスケア関連の部署にいるため、歯科医院とのお付き合いが専門でした。
そこで矯正市場について調べる機会があり、非常に伸びていることを知りました。
しかし、歯科矯正のイメージはあまりよくないのです。
・目立つ。。。
・痛そう。。。
・面倒臭い。。。
・ずっとつけているのが苦痛
・長い時間がかかる。。。
などなど
そこで、上記を解決できるアプリの作成を考えました。

## 用途
下記よりアクセスしてください。
https://orthopics.herokuapp.com
歯科矯正をしている最中の歯並びの写真やどんな装置をつけているのか、どのように歯並びが変化しているのかを投稿することができます。
投稿は写真をメインに文章も追加することができます。
投稿へのコメントも可能で、使用者同士のコミュニケーションが可能です。
投稿の検索もでき、気になる矯正方法や悩みなどを過去の投稿の中から探すことができます。



# DB
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :posts
- has_many :comments

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string|null: false|
|tag_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :tags, through: :posts_tags
- has_many :comments

## tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|post_id|references|null: false, foreign_key: true|

### Association
- has_many :posts, through: :posts_tags

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## posts_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :tag