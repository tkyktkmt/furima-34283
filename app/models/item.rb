class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :province
  belongs_to :shipping_date
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :product_name
    validates :detail
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_burden_id
      validates :shipping_date_id
    end
    validates :province_id
    validates :image
  end
end
