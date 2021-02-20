## usersテーブル

|  Column           |  Type |  Options              |
| ------------------| ------| ----------------------|
| nickname          | string| null:false            |
| encrypted_password| string| null:false            |
| email             | string| null:false,unique:true|
| family_name       | string| null:false            |
| first_name        | string| null:false            |
| family_name_kana  | string| null:false            |
| first_name_kana   | string| null:false            |
| birth             | date  | null:false            |

### Association
has_many:items,dependent::destroy
has_many：orders,dependent::destroy

## addressesテーブル
|  Colum             |  Type      |  Options        |
| -------------------| -----------| ----------------|
| postal_code        | string     | null:false      |
| prefecture_code_id | integer    | null:false      |
| city               | string     | null:false      |
| house_number       | string     | null:false      |
| building_name      | string     |                 |
| phone_number       | string     | null:false      |
| oder               | references | foreign_key:true|

### Association
belongs_to:order

## ordersテーブル
|colum| Type      | Options                    |
| ----| ----------| ---------------------------|
| user| references| null:false,foreign_key:true|
| item| references| null:false,foreign_key:true|

### Association
belongs_to:user
belongs_to:item
has_one:addresses,destination::destroy

## itemsテーブル
| Colum             | Type      | Options         |
| ------------------| ----------| ----------------|
| name              | string    | null:false      |
| explanation       | text      | null:false      |
| category_id       | integer   | null:false      |
| item_condition_id | integer   | null:false      |
| postage_payer_id  | integer   | null:false      |
| prefecture_code_id| integer   | null:false      |
| preparation_day_id| integer   | null:false      |
| price             | integer   | null:false      |
| user              | references| foreign_key:true|

### Association
belongs_to:user
has_one:order,destinations::destroy