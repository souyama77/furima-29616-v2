class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,          null: false
      t.integer    :prefecture_code_id,   null: false
      t.string     :city,                 null: false
      t.string     :house_number,         null: false
      t.string     :building_name
      t.string     :phone_number,         nill: false
      t.references :order,                foreign_key:true
      t.timestamps
    end
  end
end
