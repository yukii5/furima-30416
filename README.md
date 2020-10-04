# README

## usersテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| password_confirmation| string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_furikana | string | null: false |
| first_name_furikana  | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many : items
- has_many : comments
- has_many : orders

## itemテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| product_name       | string     | null: false                  |
| product_description| text       | null: false                  |
| category_id        | integer    | null: false                  |
| price              | integer    | null: false                  |

### Association

- belongs_to : user
- has_one : order
- has_many : comments



## addressテーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| order          | references |null: false, foreign_key: true|
| postal_code    | integer    | null: false                  |
| prefecture_id  | integer    | null: false                  |
| municipalities | string     | null: false                  |
| house_number   | string     | null: false                  |
| building_name  | string     |                              |
| phone_number   | string     | null: false                  |

### Association

- belongs_to : order


## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | references |             |
| text      | text       | null: false |


### Association

- belongs_to : users

## order テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| state_i         | integer    | null: false                    |
| region_id       | integer    | null: false                    |
| postage_id      | integer    | null: false                    |
| shipping_time_id| integer    | null: false                    |


### Association

- belongs_to : user
- belongs_to : item
- has_one : address