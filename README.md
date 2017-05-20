
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
|name|string|uniq,NOTNULL|


## messagesテーブル
**association**
-belongs_to :group
-belongs_to :user


|column|type|option|
|:-:|:-:|:-:|
|text|text|
|user_id|integer|foreign_key,NOTNULL|
|group_id|integer|foreign_key,NOTNULL|



## users_groups中間テーブル
**association**
-belongs_to :group
-belobgs_to :user


|column|type|option|
|:-:|:-:|:-:|
|user_id|integer|foreign_key,NOTNULL|
|group_id|integer|foreign_key,NOTNULL|

