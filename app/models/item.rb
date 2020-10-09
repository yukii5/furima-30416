class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_time
  belongs_to_active_hash :state

  validates :category_id, :postage_id, :region_id, :shipping_time_id, :state_id, numericality: { other_than: 0 } 

  
  with_options presence: true do
    validates :user
    validates :product_name
    validates :product_description
    validates :category_id
    validates :price
    validates :state_id
    validates :region_id
    validates :postage_id
    validates :shipping_time_id
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }


  end
end
