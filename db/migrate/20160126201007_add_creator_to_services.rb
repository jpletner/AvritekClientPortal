class AddCreatorToServices < ActiveRecord::Migration
  def change
    add_column :services, :creator, :string
  end
end
