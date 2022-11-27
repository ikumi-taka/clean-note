# README

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |



### Association
- has_many :housework_users
- has_many :houseworks, through: :housework_users
- has_many :records


## houseworksテーブル

| Column      | Type   | Options     |
|-------------|--------|-------------|
| image       | string | null: false |
| name        | string | null: false |
| type        | string | null: false |
| buy_date    | string | null: false |
| parts_image | string |             |
| parts_name  | string |             |
| parts_type  | string |             |
| exchange    | string |             |
| nickname    | string | null: false |

### Association
- has_many :housework_users
- has_many :users, through: :housework_users
- has_many :records


## housework_usersテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| housework | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :housework

## recordsテーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| task      | string     | null: false                    |
| content   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| housework | references | null: false, foreign_key: true |



### Association
- belongs_to :user
- belongs_to :housework