# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| user_image         | string |             |
| introduction       | text   | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | string | null: false |

### Association
- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy

## destination テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| user_id            | integer | null: false, foreign_key: true |
| family_name        | string  | null: false                    |
| first_name         | string  | null: false                    |
| family_name_kana   | string  |                                |
| first_name_kana    | text    | null: false                    |
| post_code          | string  | null: false                    |
| prefecture         | string  | null: false                    |
| city               | string  | null: false                    |
| address            | string  | null: false                    |
| phone_number       | string  | null: false                    |

### Association
- belongs_to :user

## card テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | integer    | null: false, foreign_key: true |
| customer_id  | string     | null: false                    |
| card_id      | string     | null: false                    |

### Association
- belongs_to :user

## category テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| ancestry | references |                                |

### Association
- belongs_to :products
※ancestryは、gem ancestryを使用する

## product テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| price              | string  | null: false                    |
| description        | string  | null: false                    |
| status             | string  |                                |
| size               | text    | null: false                    |
| shipping_cost      | string  | null: false                    |
| shipping_days      | string  | null: false                    |
| prefecture_id      | string  | null: false                    |
| judgment           | string  | null: false                    |
| category_id        | integer | null: false, foreign_key: true |
| brand_id           | integer | null: false, foreign_key: true |
| shipping_id        | integer | null: false, foreign_key: true |
| user_id            | integer | null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to_active_hash :prefecture

## image テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| image              | string  | null: false                    |
| product_id         | integer | null: false, foreign_key: true |

### Association
- belongs_to :product

## brand テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | index: true                    |

### Association
- belongs_to :products
