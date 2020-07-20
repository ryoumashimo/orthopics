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
|image|string|
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