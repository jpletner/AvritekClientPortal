require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :service_type => "MyString",
      :onsite_contact_name => "MyString",
      :onsite_contact_phone => "MyString",
      :company_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => 1,
      :equipment_description => "MyText",
      :floor => "MyString",
      :room => "MyString",
      :parking_instructions => "MyText",
      :day_option1 => "MyString",
      :day_option2 => "MyString",
      :time_option1 => "MyString",
      :time_option2 => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_service_type[name=?]", "service[service_type]"

      assert_select "input#service_onsite_contact_name[name=?]", "service[onsite_contact_name]"

      assert_select "input#service_onsite_contact_phone[name=?]", "service[onsite_contact_phone]"

      assert_select "input#service_company_name[name=?]", "service[company_name]"

      assert_select "input#service_address[name=?]", "service[address]"

      assert_select "input#service_city[name=?]", "service[city]"

      assert_select "input#service_state[name=?]", "service[state]"

      assert_select "input#service_zipcode[name=?]", "service[zipcode]"

      assert_select "textarea#service_equipment_description[name=?]", "service[equipment_description]"

      assert_select "input#service_floor[name=?]", "service[floor]"

      assert_select "input#service_room[name=?]", "service[room]"

      assert_select "textarea#service_parking_instructions[name=?]", "service[parking_instructions]"

      assert_select "input#service_day_option1[name=?]", "service[day_option1]"

      assert_select "input#service_day_option2[name=?]", "service[day_option2]"

      assert_select "input#service_time_option1[name=?]", "service[time_option1]"

      assert_select "input#service_time_option2[name=?]", "service[time_option2]"
    end
  end
end
