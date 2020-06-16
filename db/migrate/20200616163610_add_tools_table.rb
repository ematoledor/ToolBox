class AddToolsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.references :user
      t.string :condition
      t.integer :price
      t.string :photos
 
      t.timestamps
    end
  end
end
