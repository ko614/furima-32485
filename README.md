## テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| encrypted_password       | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |


### Association

- has_many :items
- has_many :buy


## items テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| name            | string | null: false |
| description     | string | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| delivery_fee_id    | integer | null: false |
| ship_form_id       | integer | null: false |
| shipping_days_id   | integer | null: false |
| user_id         | references | null: false, foreign_key: true  |
| price           | string | null: false |

### Association

- belongs_to :users
- has_one :buy



## Destination テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buy_id       | references | null: false, foreign_key: true |
| post_code    | string | null: false                        |
| prefecture   | string | null: false                        |
| city         | string | null: false                        |
| address      | string | null: false                        |
| phone_number | string | null: false                        |
### Association

- belongs_to :buy


## buy テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| items_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

