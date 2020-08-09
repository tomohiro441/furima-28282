class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text :info
      t.integer :price 
      t.integer :category_id 
      t.integer :delivery_fee_id
      t.integer :delivery_region_id 
      t.integer :delivery_date_id
      t.references :user
      t.timestamps
    end
  end
end
