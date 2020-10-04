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
| birthday_year        | integer| null: false |
| birthday_month       | integer| null: false |
| birthday_dat         | integer| null: false |

### Association

- belongs_to : address
- belongs_to : pay
- has_many : items
- has_many : comments
- has_many : orders

## itemsテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user_id            | references |null: false, foreign_key: true|
| image              | text       | null: false                  |
| product name       | string     | null: false                  |
| Product Description| text       | null: false                  |
| category           | string     | null: false                  |
| state              | string     | null: false                  |
| region             | string     | null: false                  |
| postage            | string     | null: false                  |
| Shipping Time      | string     | null: false                  |
| price              | integer    | null: false                  |

### Association

- belongs_to : users
- belongs_to : orders
- has_many : comments

## addressテーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| user_id        | references |null: false, foreign_key: true|
| postal code    | integer    | null: false                  |
|  prefecture    | string     | null: false                  |
| municipalities | string     | null: false                  |
| house number   | string     | null: false                  |
| building name  | text       |                              |
|  phone number  | integer    | null: false                  |

### Association

- belongs_to : users


## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | references |             |
| text      | text       | null: false |

### Association

- belongs_to : users
- belongs_to : items

## payテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| user_id      | references | null: false, foreign_key: true|
| card_number  | integer    | null: false |
| year         | integer    | null: false |
| month        | integer    | null: false |
| security code| integer    | null: false |

### Association

- belongs_to : users

## order テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |


### Association

- belongs_to : users
- belongs_to : users