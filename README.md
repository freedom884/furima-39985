# テーブル設計

## users テーブル

| Column             | Type     | Options            |
| ------------------ | -------- | ------------------ |
| nickname           | string   | null: false        |
| email              | string   | unique,null: false |
| encrypted_password | string   | null: false        |
| family_name        | string   | null: false        |
| first_name         | string   | null: false        |
| family_name_kana   | string   | null: false        |
| family_name_kana   | string   | null: false        |
| birth_day          | datetime | null: false        |

### Association
- has_many :products 
- has_many:purchases
- has_many :destinations
- belong_to :shipping_addresses

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| id                 | integer    | primary key                    |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     |                                |
| condition          | string     |                                |
| shipping_fee       | string     | null: false                    |
| days_to_ship       | integer    | null: false                    |
| origin_region      | string     |                                |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user

### テーブル: purchases

| Column         | Type         | Options               |
| -------------- | ------------ | --------------------- |
| id             | integer      | primary key           |
| user_id        | references   | foreign key (users)   |
| product_id     | references   | foreign key (products)|
| quantity       | integer      | not null              |
| total_price    | decimal      | not null              |
| purchased_at   | datetime     |                       |

### Association
- belongs_to :user
- has_many: products

### テーブル: shipping_addresses

| Column         | Type     | Options               |
| -------------- | -------- | --------------------- |
| id             | integer  | primary key           |
| user_id        | integer  | foreign key (users)   |
| recipient_name | string   | not null              |
| address_line1  | string   | not null              |
| address_line2  | string   |                       |
| city           | string   | not null              |
| postal_code    | string   | not null              |
| created_at     | datetime |                       |
| updated_at     | datetime |                       |
### Association
- belongs_to :user
- has many :purchases
