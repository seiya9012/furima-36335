# README

##user

| Column              | Type       | Options     |
|---------------------|------------|-------------|
| nick name           | string     | null:false  |
| user_password       | string     | null:false  |
| first_name          | string     | null:false  |
| family_name         | string     | null:false  |
| first_name_kana     | string     | null:false  |
| family_name_kana    | string     | null:false  |
| birth_date          | string     | null:false  |



### Association
- has_many : items
- belongs_to : custmer
- belongs_to : card

 ##items

 | Column             | Type       | Options     |
 |--------------------|------------|-------------|
 | image              | string     | null:false  |
 | discription        | string     | null:false  |
 | judgment           | string     | null:false  |
 | status             | string     | null:false  |
 | cost               | string     | null:false  |
 | city               | string     | null:false  |
 | days               | string     | null:false  |
 | amount_sold        | string     | null:false  |
 

## Association
- belongs_to :user


##custmer
| Column             | Type       | Options     |
|--------------------|------------|-------------|
| post_code          | string     | null:false  |
| prefecture         | string     | null:false  |
| city               | string     | null:false  |
| adress             | string     | null:false  |
| building_name      | string     | null:false  |
| phone_number       | string     | null:false  |

## Association
- belongs_to :user

##card
| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| user_id            | integer    | null: false, foreign_key: true|
| customer_id        | string     | null: false                   |
| card_id            | string     | null: false                   |

## Association
- belongs_to :user
