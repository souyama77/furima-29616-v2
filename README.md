## userテーブル

|  Column  |  Type  |  Options                          |
| -------- | ------ | ----------------------------------|
| nickname | string | null:false                        |
| password | string | null:false                        |
| email    | string | null:false, unique:true,index:true|

### Association
has_one:profile,dependent::destroy
has_one:credit_card,dependent::destroy
has_one:shipping,dependent::destroy
has_many:seller_items,foreign_key:"seller_id",class_name:"items"
has_many:buyer_items,foreign_key:"buyer_id",class_name:"items"

## profilesテーブル
|  Colum           |  Type      |  Options                    |
| -----------------| -----------| ----------------------------|
| family_name      | string     | null:false                  |
| first_name       | string     | null:false                  |
| family_name_kana | string     | null:false                  |
| first_name_kana  | string     | null:false                  |
| birth_year       | date       | null:false                  |
| birth_month      | date       | null:false                  |
| birth_day        | date       | null:false                  |
| user             | references | null:false, foreign_key:true|

### Association
belongs_to:user

## shippingテーブル
|  Colum          |  Type      |  Options                    |
| ----------------| -----------| ----------------------------|
| post_code       | integer    | null:false                  |
| prefecture_code | integer    | null:false                  |
| city            | string     | null:false                  |
| house_num       | string     | null:false                  |
| building_name   | string     |                             |
| home_coll_num   | integer    | unique:true                 |
| user            | references | null:false, foreign_key:true|

### Association
belongs_to:user

## credit_cadesテーブル
| Colum           | Type      | Options                    |
| ----------------| ----------| ---------------------------|
| card_num        | integer   | null:false, unique:true    |
| expiration_year | integer   | null:false                 |
| expiration_month| integer   | null:false                 |
| security_code   | integer   | null:false                 |
| user            | references| null:false,foreign_key:true|

### Association
belongs_to:user

## itemsテーブル
| Colum           | Type      | Options                    |
| ----------------| ----------| ---------------------------|
| name            | string    | null:false                 |
| item_explanation| text      | null:false                 |
| category        | references| null:false,foreign_key:true|
| item_condition  | references| null:false,foreign_key:true|
| postage_payer   | references| null:false,foreign_key:true|
| prefecture_code | integer   | null:false                 |
| preparation_day | references| null:false,foreign_key:true|
| price           | integer   | null:false                 |
| seller          | references| null:false,foreign_key:true|
| buyer           | references| foreign_key:true           |

### Association
has_many:item_img,dependent::destroy
belongs_to:category
belongs_to:seller,class_name:"User"
belongs_to:buyer,class_name:"User"
belongs_to_active_hash:item_condition
belongs_to_active_hash:postage_payer
belongs_to_active_hash:preparation_day

## item_imgテーブル
| Colum  | Type     | Options                |
| -------| ---------| -----------------------|
| image  | string   | null:false             |
| item_id| reference| null:false,foreign:true|

### Association
belongs_to_:item

## categoriesテーブル
| Colum   | Type  | Options   |
| --------| ------| ----------|
| category| string| null:false|
| ancestry| string| null:false|

### Association
has_many:items

## item_conditionsテーブル
| Colum   | Type  | Options   |
| --------| ------| ----------|
|condition| strung| null:false|

### Association
has_many:items
