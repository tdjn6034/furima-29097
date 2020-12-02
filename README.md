## usersテーブル

|   Column          |Type  |  Options                |
|-------------------|------|-------------------------|
|nickname           |string|null: false              |
|email              |string|null: false, unique: true|
|encrypted_password |string|null: false              |
|last_name          |string|null: false              |
|first_name         |string|null: false              |
|last_name_kana     |string|null: false              |
|first_name_kana    |string|null: false              |
|birthday           |date  |null: false              |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

|Column              |Type       |Options                       |
|--------------------|-----------|------------------------------|
|name           |string     |null: false                   |
|product_description |text       |null: false                   |
|category_id         |string     |null: false                   |
|quality_id          |string     |null: false                   |
|delivery_fee_id     |string     |null: false                   |
|shipment_source_id  |string     |null: false                   |
|days_to_ship_id     |string     |null: false                   |
|price               |integer    |null: false                   |
|user                |references |null: false, foreign_key: true|

### Association
- has_one :purchase_records
- belongs_to :users


## purchase_recordsテーブル

|Column|Type       |Options          |
|------|-----------|-----------------|
|user  |references |foreign_key: true|
|when  |string     |null: false      |
|item  |references |foreign_key: true|

### Association
- belongs_to :items
- has_one :addresses
- belongs_to :users


## addressesテーブル

|Column         |Type      |Options          |
|---------------|----------|-----------------|
|postal_code    |string    |null: false      |
|prefecture_id  |string    |null: false      |
|municipality   |string    |null: false      |
|address        |string    |null: false      |
|building_name  |string    |-----------------|
|phone_number   |string    |null: false      |
|purchase_record|references|foreign_key :true|

### Association
- belongs_to :purchase_records