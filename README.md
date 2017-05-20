== README

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

## Datebase設計

## usersテーブル
**association**
-has_many :users_groups
-has_mamy :groups, through: :groups_users
-has_many :messages

|colum|type|option|
|:-:|:-:|:-:|
|name|string|index,unique,NOTNULL|




## groupsテーブル
**association**
-has_many :users_groups
-has many :users, through: :groups_users
-has_many :messages


|column|type|option|
|:-:|:-:|:-:|
|name|string|NOTNULL|


## messagesテーブル
**association**
-belongs_to :group
-belongs_to :user


|column|type|option|
|:-:|:-:|:-:|
|text|text|
|user_id|integer|foreign_key|
|group_id|integer|foreign_key|



## users_groups中間テーブル
**association**
-belongs_to :group
-belobgs_to :user


|column|type|option|
|:-:|:-:|:-:|
|user_id|integer|foreign_key|
|group_id|integer|foreign_key|

