class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_type
      t.string :onsite_contact_name
      t.string :onsite_contact_phone
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.text :equipment_description
      t.string :floor
      t.string :room
      t.text :parking_instructions
      t.string :day_option1
      t.string :day_option2
      t.string :time_option1
      t.string :time_option2

      t.timestamps null: false
    end
  end
end
