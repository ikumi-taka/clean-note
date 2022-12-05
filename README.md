# README

## usersテーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |



### Association
- has_many :housework_users
- has_many :houseworks, through: :housework_users
- has_many :records


## houseworksテーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|
| image          | string |             |
| housework_name | string | null: false |
| housework_type | string |             |
| buy_date       | string |             |
| parts_image    | string |             |
| parts_name     | string |             |
| parts_type     | string |             |
| exchange       | string |             |
| name           | string | null: false |

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