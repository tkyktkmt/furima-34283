class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,           null: false
      t.text       :detail,                 null: false
      t.integer    :category_id,            null: false
      t.integer    :status_id,              null: false
      t.integer    :shipping_fee_burden_id, null: false
      t.integer    :province_id,            null: false
      t.integer    :shipping_date_id,       null: false
      t.integer    :price,                  null: false
      t.references :user,                   foreign_key: true
      t.timestamps
    end
  end
end
