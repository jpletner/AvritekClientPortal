class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
        t.integer :service_id
        t.attachment :photo

      t.timestamps null: false
    end
  end
end
