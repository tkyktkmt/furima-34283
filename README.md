<!-- ## users table

| Column                | Type   | Options     |
|-----------------------|--------|-------------|
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| family_name(kanji)    | string | null: false |
| first_name(kanji)     | string | null: false |
| family_name(katakana) | string | null: false |
| first_name(katakana)  | string | null: false |
| birthday              | string | null: false |

### association

- has_many :items
- has_many :comments
- has_one  :purchase

## items

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------| 
| image               | ActiveStorageで実装                         |
| product_name        | string    | null: false                    |
| detail              | string    | null: false                    |
| category            | string    | null: false                    |
| status              | string    | null: false                    |
| shipping_fee_burden | string    | null: false                    |
| shipping_location   | string    | null: false                    |
| shipping_date       | string    | null: false                    |
| price               | string    | null: false                    |
| user_id             | reference | null: false, foreign_key: true |

### association

- belongs_to :user
- has_many   :comments
- has_one    :purchases

## comments

| Column       | Type      | Options                        |
|--------------|-----------|--------------------------------|
| comment_text | string    | null: false                    |
| user_id      | reference | null: false, foreign_key: true |
| item_id      | reference | null: false, foreign_key: true |

### association

- belongs_to :users
- belongs_to :items

## purchases

| Column             | Type      | Options                        |
|--------------------|-----------|--------------------------------|
| expiration_date    | string    | null: false                    |
| security           | string    | null: false                    |
| province           | string    | null: false                    |
| city               | string    | null: false                    |
| address_line1      | string    | null: false                    |
| address_line2      | string    | null: false                    |
| phone_number       | string    | null: false                    |
| credit_card_number | string    | null: false                    |
| user_id            | reference | null: false, foreign_key: true |
| item_id            | reference | null: false, foreign_key: true |

### association

- belongs_to :item
- belongs_to :user -->

## users table

| Column                | Type   | Options      |
|-----------------------|--------|--------------|
| nickname              | string | unique: true |
| email                 | string | unique: true |
| password              | string | null: false  |
| family_name(kanji)    | string | null: false  |
| first_name(kanji)     | string | null: false  |
| family_name(katakana) | string | null: false  |
| first_name(katakana)  | string | null: false  |
| birthday              | string | null: false  |

### association

- has_many :items
- has_many :purchases

## items

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------| 
| image               | ActiveStorageで実装?                        |
| product_name        | string    | null: false                    |
| detail              | string    | null: false                    |
| category            | string    | null: false                    |
| status              | string    | null: false                    |
| shipping_fee_burden | string    | null: false                    |
| shipping_location   | string    | null: false                    |
| shipping_date       | string    | null: false                    |
| price               | string    | null: false                    |
| user_id             | reference | null: false, foreign_key: true |

### association

- belongs_to :user
- has_one    :purchase

## purchases

| Column             | Type      | Options                        |
|--------------------|-----------|--------------------------------|
| buyer_name         | string    | null: false                    |
| purchased_item     | string    | null: false                    |
| user_id            | reference | null: false, foreign_key: true |
| item_id            | reference | null: false, foreign_key: true |

### association

- belongs_to :item
- belongs_to :user

## locations

| Column        | Type      | Options                        |
|---------------|-----------|--------------------------------|
| province      | string    | null: false                    |
| city          | string    | null: false                    |
| address_line1 | string    | null: false                    |
| address_line2 | string    | null: false                    |
| phone_number  | string    | null: false                    |
| purchased_id  | reference | null: false, foreign_key: true |

### association

- belongs_to :purchase

