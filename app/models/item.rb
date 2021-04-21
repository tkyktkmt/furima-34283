class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :province
  belongs_to :shipping_date

  with_options presence: true do 
    validates :product_name          
    validates :detail                
    validates :price
    with_options numericality: { other_than: 1} do
      validates :category_id           
      validates :status_id             
      validates :shipping_fee_burden_id
      validates :province_id           
      validates :shipping_date_id      
    end
    validates :user_id               
  end
end
    