<<<<<<< HEAD
<!-- ・ユーザー管理機能
   users_table
・チャットグループ管理機能
   groups_table
・チャットメッセージの保存機能
   massages_table 
・中間table
   users_groups_table
  -->


## users_table
|Column|Type|Options|
|------|----|-------|
|id----|integer|----|
|email|string|------|
|password|string|---|
|name|string|index: true, null: false|
### Association
- has_many :messages
- has_many :groups

## groups_table
|Column|Type|Options|
|------|----|-------|
|name|references|null: false, foreign_key: true|
### Association
- has_many :user

## massages_table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## users_groups_table(中間table)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user
=======
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
>>>>>>> parent of f90ab2b... Updagte README.md
