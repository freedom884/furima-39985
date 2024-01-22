# テーブル設計

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | unique: true,null: false |
| encrypted_password | string   | null: false              |
| family_name        | string   | null: false              |
| first_name         | string   | null: false              |
| family_name_kana   | string   | null: false              |
| family_name_kana   | string   | null: false              |
| birth_day          | date     | null: false              |

### Association
- has_many :products 
- has_many:purchases
- 
- 

## products テーブル

| Column             | Type       | Options                                        |
| ------------------ | ---------- | ---------------------------------------------- |
| name               | string     | null: false                                    |
| description        | text       | null: false                                    |
| category_id        | integer    | null: false                                    |
| condition_id       | integer    | null: false                                    |
| shipping_fee_id    | integer    | null: false                                    |
| days_to_ship_id    | integer    | null: false                                    |
| origin_region_id   | integer    | null: false                                    |
| price              | integer    | null: false                                    |
| seller             | references | null: false, foreign_key: { to_table: :users } |

### Association
- belongs_to :user
- has_one :purchase

### テーブル: purchases

| Column         | Type         | Options                            |
| -------------- | ------------ | ---------------------------------- |
| seller         | references   | foreign_key: true                  |
| buyer          | references   | foreign_key: { to_table: :users }  |

### Association
- belongs_to :user
- belongs_to :product
- has_one :shipping_addresses

### テーブル: shipping_addresses

| Column         | Type       | Options                          |
| -------------- | ---------- | -------------------------------- |
| post_code      | string     | null: false                      |
| prefecture     | string     | null: false                      |
| city           | string     | null: false                      |
| house_number   | string     | null: false                      |
| building_name  | string     |                                  |
| phone_number   | string     | null: false                      |
| user           | references | null: false, foreign_key: true   |

### Association
- belongs_to :purchase
- belongs_to :user
