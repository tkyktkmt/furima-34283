class OrderLocation 
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :postal_code, :province_id, :city, :address_line1, :address_line2, :phone_number
  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :province_id, numericality: {other_than: 0, message: "can't be blank"}
   validates :city
   validates :address_line1
   validates :phone_number, format: {with: /\A\d{1,11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id, )
    Location.create(postal_code: postal_code, province_id: province_id, city: city, addless_line1: addless_line1, addless_line2: addless_line2, phone_number: phone_number, order_id: order.id)
  end
end