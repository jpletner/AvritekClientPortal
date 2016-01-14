class AddNumOfPalletsToServices < ActiveRecord::Migration
  def change
    add_column :services, :pallets, :string
  end
end
