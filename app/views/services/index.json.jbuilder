json.array!(@services) do |service|
  json.extract! service, :id, :service_type, :onsite_contact_name, :onsite_contact_phone, :company_name, :address, :city, :state, :zipcode, :equipment_description, :floor, :room, :parking_instructions, :day_option1, :day_option2, :time_option1, :time_option2
  json.url service_url(service, format: :json)
end
