require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :service_type => "Service Type",
        :onsite_contact_name => "Onsite Contact Name",
        :onsite_contact_phone => "Onsite Contact Phone",
        :company_name => "Company Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => 1,
        :equipment_description => "MyText",
        :floor => "Floor",
        :room => "Room",
        :parking_instructions => "MyText",
        :day_option1 => "Day Option1",
        :day_option2 => "Day Option2",
        :time_option1 => "Time Option1",
        :time_option2 => "Time Option2"
      ),
      Service.create!(
        :service_type => "Service Type",
        :onsite_contact_name => "Onsite Contact Name",
        :onsite_contact_phone => "Onsite Contact Phone",
        :company_name => "Company Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zipcode => 1,
        :equipment_description => "MyText",
        :floor => "Floor",
        :room => "Room",
        :parking_instructions => "MyText",
        :day_option1 => "Day Option1",
        :day_option2 => "Day Option2",
        :time_option1 => "Time Option1",
        :time_option2 => "Time Option2"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Service Type".to_s, :count => 2
    assert_select "tr>td", :text => "Onsite Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Onsite Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Floor".to_s, :count => 2
    assert_select "tr>td", :text => "Room".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Day Option1".to_s, :count => 2
    assert_select "tr>td", :text => "Day Option2".to_s, :count => 2
    assert_select "tr>td", :text => "Time Option1".to_s, :count => 2
    assert_select "tr>td", :text => "Time Option2".to_s, :count => 2
  end
end
