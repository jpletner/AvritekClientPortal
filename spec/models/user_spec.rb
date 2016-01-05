require_relative '../rails_helper'

describe User, type: :model do
 it "should accept a first name, last name, email, phone, company info, password, and password confirmation" do
   aUser = User.new
   aUser.first_name = "Chuck"
   aUser.last_name = "Norris"
   aUser.email = "chucknorris@gmail.com"
   aUser.phone_number= "619-555-1234"
   aUser.company_name = "Google"
   aUser.company_address = "123 Main St"
   aUser.company_city = "San Diego"
   aUser.company_state = "California"
   aUser.company_zip = "99999"
   aUser.company_phone = "800-555-1200"
   aUser.onsite_contact_name = "Fred"
   aUser.onsite_contact_phone = "800-555-1210"
   aUser.parking_instructions = "parking in parking lot"
   aUser.password = "password"
   aUser.encrypted_password = "password"
   aUser.save
   expect(aUser.first_name).to eq "Chuck"
   expect(aUser.last_name).to eq "Norris"
   expect(aUser.email).to eq "chucknorris@gmail.com"
   expect(aUser.phone_number).to eq "619-555-1234"
   expect(aUser.company_name).to eq "Google"
   expect(aUser.company_address).to eq "123 Main St"
   expect(aUser.company_city).to eq "San Diego"
   expect(aUser.company_state).to eq "California"
   expect(aUser.company_zip).to eq "99999"
   expect(aUser.company_phone).to eq "800-555-1200"
   expect(aUser.onsite_contact_name).to eq "Fred"
   expect(aUser.onsite_contact_phone).to eq "800-555-1210"
   expect(aUser.parking_instructions).to eq "parking in parking lot"
   expect(aUser.password).to eq "password"
   expect(aUser.encrypted_password).to eq "password"
 end
end
