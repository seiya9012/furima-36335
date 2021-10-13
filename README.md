# README

##user

| Column              | Type       | Options     |
|---------------------|------------|-------------|
| nick_name           | string     | null:false  |
| email               | string     | null:false  |
| encrypted_password  | string     | null:false  |
| first_name          | string     | null:false  |
| family_name         | string     | null:false  |
| first_name_kana     | string     | null:false  |
| family_name_kana    | string     | null:false  |
| birth_date          | date       | null:false  |



### Association
- has_many : items
- belongs_to : adress
- has_many : managemennt

 ##items

 | Column             | Type       | Options     |
 |--------------------|------------|-------------|
 | name               | string     | null:false  |
 | discription        | string     | null:false  |
 | status_id          | integer    | null:false  |
 | cost_id            | integer    | null:false  |
 | city_id            | integer    | null:false  |
 | days_id            | integer    | null:false  |
 | price              | string     | null:false  |
 | user            | references     | null:false,foreign_key: true  |

 

## Association
- belongs_to :user
- has_one :management


##Adress
| Column             | Type       | Options     |
|--------------------|------------|-------------|
| post_code          | string     | null:false  |
| prefecture_id      | integer    | null:false  |
| city               | string     | null:false  |
| adress             | string     | null:false  |
| building_name      | string     |             |
| phone_number       | string     | null:false  |
| user_id            | integer    | null: false, foreign_key: true |

## Association
- has_one :management

##management
| Column             | Type       | Options                       |
|--------------------|------------|-------------------------------|
| user            | references    | null: false, foreign_key: true|
| items           | references    | null: false                   |

## Association
- belongs_to :user