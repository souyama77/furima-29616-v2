## userテーブル

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
has_one:profile,dependent::destroy
has_one:credit_card,dependent::destroy
has_one:shipping,dependent::destroy


## shippingテーブル
|  Colum          |  Type      |  Options                    |
| ----------------| -----------| ----------------------------|
| post_code       | string     | null:false                  |
| prefecture_code | integer    | null:false                  |
| city            | string     | null:false                  |
| house_num       | string     | null:false                  |
| building_name   | string     |                             |
| phone_num       | string     | unique:true                 |

## purchase_managementテーブル
| user            | references | null:false,foreign_key:true |
| item            | reference  | null:false,foreign_key:true |

### Association
belongs_to:user
belongs_to:item

## itemsテーブル
| Colum             | Type      | Options                    |
| ------------------| ----------| ---------------------------|
| name              | string    | null:false                 |
| item_explanation  | text      | null:false                 |
| category_id       | integer   |null:false,foreign_key:true |
| item_condition_id | integer   | null:false,foreign_key:true|
| postage_payer_id  | integer   | null:false,foreign_key:true|
| prefecture_code   | integer   | null:false                 |
| preparation_day_id| integer   | null:false,foreign_key:true|
| price             | integer   | null:false                 |
| user              | references| foreign_key:true           |

### Association
belongs_to:user
belongs_to_active_hash:category
belongs_to_active_hash:item_condition
belongs_to_active_hash:postage_payer
belongs_to_active_hash:preparation_day

## item_conditionsテーブル
| Colum   | Type  | Options   |
| --------| ------| ----------|
|condition| strung| null:false|

### Association
has_many:items
