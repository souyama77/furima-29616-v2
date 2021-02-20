class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category
    validates :item_condition
    validates :postage_payer
    validates :prefecture_code
    validates :preparation_day
    validates :price, inclusion: {in: 300...9_999_999}, format: {with:/\A[0-9]+\z/}
  end
  with_options numericality:{ other_than:0} do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end
  belongs_to :user
  has_one_attached :image
  has_one :order
end
