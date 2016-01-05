class AddForeignKeyToServicesToAssociateWithUsers < ActiveRecord::Migration
  def change
      add_reference :services, :user, index: true
      add_foreign_key :services, :users
  end
end
