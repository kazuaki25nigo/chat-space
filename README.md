<!-- ・ユーザー管理機能
   users_table
・チャットグループ管理機能
   groups_table
・チャットメッセージの保存機能
   massages_table 
・中間table
   users_groups_table
  -->


## users
|Column|Type|Options|
|------|----|-------|
|id----|integer|----|
|email|string|------|
|password|string|---|
|name|string|index: true, null: false|
### Association
has_many :messages
has_many :users_groups
has_many :users, through: :user_groups

## groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,|
### Association
has_many :users, through: :user_groups
has_many :massages
has_many :users_groups

## massages
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
|image|string|------|
|body|text|null: false|
### Association
- belongs_to :group
- belongs_to :user

## users_groups(中間table)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user