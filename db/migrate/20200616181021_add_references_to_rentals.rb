class AddReferencesToRentals < ActiveRecord::Migration[6.0]
  def change
    add_reference :rentals, :user, index: true
    add_reference :rentals, :tool, index: true
  end
end
