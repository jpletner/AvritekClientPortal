require 'rails_helper'

RSpec.describe "services/show", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Service Type/)
    expect(rendered).to match(/Onsite Contact Name/)
    expect(rendered).to match(/Onsite Contact Phone/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Floor/)
    expect(rendered).to match(/Room/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Day Option1/)
    expect(rendered).to match(/Day Option2/)
    expect(rendered).to match(/Time Option1/)
    expect(rendered).to match(/Time Option2/)
  end
end
