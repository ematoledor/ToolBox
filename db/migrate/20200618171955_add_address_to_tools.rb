class AddAddressToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :address, :string
  end
end
