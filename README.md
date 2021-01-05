## テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false,unique: true |
| encrypted_password | string | null: false |
| family_name     | string |  |
| first_name      | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |


### Association

- has_many :items
- has_many :buys


## items テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| name            | string | null: false |
| description     | text | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| delivery_fee_id    | integer | null: false |
| ship_form_id       | integer | null: false |
| shipping_day_id   | integer | null: false |
| user         | references | null: false, foreign_key: true  |
| price           | integer | null: false |
| prefecture_id   | integer |null:false                      | 

### Association

- belongs_to :user
- has_one :buy



## Destination テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buy       | references | null: false, foreign_key: true |
| post_code    | string | null: false                        |
| prefecture_id   | integer |null:false                      | 
| city         | string | null: false                        |
| address      | string | null: false                        |
| building_name      | string |                         |
| phone_number | string | null: false                        |
### Association

- belongs_to :buy


## buy テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination


