class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string        :postal_code,   null: false
      t.integer       :province_id,   null: false
      t.string        :city,          null: false
      t.string        :address_line1, null: false
      t.string        :address_line2, null: false
      t.string        :phone_number,  null: false
      t.references    :order,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
