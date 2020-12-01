## usersテーブル

|   Column       |Type  |  Options                |
|----------------|------|-------------------------|
|  nickname      |string|null: false              |
| mail_address   |string|null: false, unique: true|
|  password      |string|null: false              |
|real_name       |string|null: false              |
| real_name_kana |string|null: false              |
|birthday        |string|null: false              |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル

|Column              |Type       |Options                       |
|--------------------|-----------|------------------------------|
|image               |string     |null: false                   |
|item_name           |string     |null: false                   |
|product_description |text       |null: false                   |
|category            |string     |null: false                   |
|quality             |string     |null: false                   |
|delivery_fee        |string     |null: false                   |
|shipment_source     |string     |null: false                   |
|days_to_ship        |string     |null: false                   |
|price               |string     |null: false                   |
|seller              |references |null: false, foreign_key: true|

### Association
- has_one :purchase_records


## purchase_recordsテーブル

|Column|Type       |Options          |
|------|-----------|-----------------|
|who   |references |foreign_key: true|
|when  |string     |null: false      |
|what  |references |foreign_key: true|

### Association
- belongs_to :items
- has_one :addresses


## addressesテーブル

|Column         |Type  |Options    |
|---------------|------|-----------|
|postal_code    |string|null: false|
|prefectures    |string|null: false|
|municipality   |string|null: false|
|address        |string|null: false|
|building_name  |string|-----------|
|phone_number   |string|null: false|


### Association
- belongs_to :purchase_records