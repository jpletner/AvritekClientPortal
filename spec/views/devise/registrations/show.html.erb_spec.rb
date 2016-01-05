require 'rails_helper'

RSpec.describe "devise/registrations/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "Black",
      :last_name => "Widow",
      :email => "bw@gmail.com",
      :password => "password",
      :company_name => "Company Name",
      :company_address => "123 Main St"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Black/)
    expect(rendered).to match(/Widow/)
    expect(rendered).to match(/bw@gmail.com/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/123 Main St/)
  end
end
