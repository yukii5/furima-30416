class AddressForm

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :region_id, :municipalities, :house_number, :building_name, :price, :order_id, :phone_number, :address

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end

  validates :region_id, numericality: { other_than: 0 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
      
      Address.create(postal_code: postal_code, region_id: region_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end