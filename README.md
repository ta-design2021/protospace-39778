# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| profile            | text   | null: false               |
| occupation         | text   | null: false               |
| position           | text   | null: false               |

### Association

<!-- - has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages -->

## prototypes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

<!-- ※image は ActiveStorage で実装するため含まない -->

### Association

<!-- - has_many :room_users
- has_many :users, through: :room_users
- has_many :messages -->

## room_users テーブル

<!-- | Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true | -->

### Association

<!-- - belongs_to :room
- belongs_to :user -->

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

<!-- # prototypesテーブルとのアソシエーション -->

- belongs_to :prototype
<!-- # usersテーブルとのアソシエーション -->
- belongs_to :user
