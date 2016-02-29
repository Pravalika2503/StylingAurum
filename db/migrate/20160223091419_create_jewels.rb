class CreateJewels < ActiveRecord::Migration
  def change
    create_table :jewels do |t|
      t.string :product_code
      t.string :jewel_type
      t.string :metal_type
      t.string :stone_type
      t.integer :weight
      t.integer :stone_weight
      t.integer :purity
      t.integer :pieces_number
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :in_stock
      t.boolean :is_shipping
      t.integer :price
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
