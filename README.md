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


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

## Datebase設計

## usersテーブル
**association**
-has_many :remarks
-has_many :users_groups
-has_mamy :groups, through: :users_groups

|column   |type    |
|---------|--------|
|name     |string  |



## groupsテーブル
**association**
-has_many :remarks
-has_many :users_groups
-has many :users, through: :users_groups


|column   |type    |
|---------|--------|
|name     |string  |



## remarksテーブル
**association**
-belongs_to :user
-belongs_to :group


|column   |type    |
|---------|--------|
|name     |string  |
|user_id  |integer |
|group_id |integer |



## users_groups中間テーブル
**association**
-belongs_to :user
-belobgs_to :group


|column   |type    |
|---------|--------|
|user_id  |integer |
|group_id |integer |

