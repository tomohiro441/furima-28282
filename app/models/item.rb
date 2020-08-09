class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date
  with_options presence: true do
    validates :name 
    validates :info
    validates :price 
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :delivery_region_id , numericality: { other_than: 1 }
    validates :delivery_date_id, numericality: { other_than: 1 }
    validates :user
  end  
end