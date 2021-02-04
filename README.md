## usersテーブル

|   Column          |Type  |  Options                |
|-------------------|------|-------------------------|
|nickname           |string|null: false              |
|email              |string|null: false, unique: true|
|encrypted_password |string|null: false              |
|last_name          |string|null: false              |
|first_name         |string|null: false              |
|last_name_reading  |string|null: false              |
|first_name_reading |string|null: false              |
|birthday           |date  |null: false              |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

|Column              |Type       |Options                       |
|--------------------|-----------|------------------------------|
|name                |string     |null: false                   |
|product_description |text       |null: false                   |
|category_id         |integer    |null: false                   |
|quality_id          |integer    |null: false                   |
|delivery_fee_id     |integer    |null: false                   |
|prefecture_id       |integer    |null: false                   |
|days_to_ship_id     |integer    |null: false                   |
|price               |integer    |null: false                   |
|user                |references |null: false, foreign_key: true|

### Association
- has_one :purchase_record
- belongs_to :user


## purchase_recordsテーブル

|Column|Type       |Options          |
|------|-----------|-----------------|
|user  |references |foreign_key: true|
|item  |references |foreign_key: true|

### Association
- belongs_to :item
- has_one :address
- belongs_to :user


## addressesテーブル

|Column          |Type      |Options          |
|----------------|----------|-----------------|
|postal_code     |string    |null: false      |
|prefecture_id   |integer   |null: false      |
|municipality    |string    |null: false      |
|address         |string    |null: false      |
|building_name   |string    |-----------------|
|phone_number    |string    |null: false      |
|purchase_record |references|foreign_key :true|

### Association
- belongs_to :purchase_record


## commentsテーブル

|Column  |Type       |Options          |
|--------|---------- |-----------------|
|user    |references |foreign_key :true|
|item    |references |foreign_key :true|
|text    |string     |null: false      |

### Association
- belongs_to :item
- belongs_to :user