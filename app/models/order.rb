class Order < ApplicationRecord
attr_accessor :token
validates :token, presence: true

belongs_to :user
belongs_to :item
has_one :address
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :from
end
