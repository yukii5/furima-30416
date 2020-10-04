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

- belongs_to : address
- belongs_to : pay
- has_many : items
- has_many : comments
- has_many : orders

## itemテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references |null: false, foreign_key: true|
| image              | text       | null: false                  |
| product name       | string     | null: false                  |
| Product Description| text       | null: false                  |
| category_id        | integer    | null: false                  |
| state_id           | integer    | null: false                  |
| region_id          | integer    | null: false                  |
| postage_id         | integer    | null: false                  |
| Shipping Time_id   | integer    | null: false                  |
| price              | integer    | null: false                  |

### Association

- belongs_to : users
- has_one : orders
- has_many : comments

## addressテーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| user           | references |null: false, foreign_key: true|
| postal code    | integer    | null: false                  |
|  prefecture    | string     | null: false                  |
| municipalities | string     | null: false                  |
| house number   | string     | null: false                  |
| building name  | string     |                              |
|  phone number  | string     | null: false                  |

### Association

- belongs_to : users


## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | references |             |
| text      | text       | null: false |


### Association

- belongs_to : users

## order テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association

- belongs_to : users
- belongs_to : users