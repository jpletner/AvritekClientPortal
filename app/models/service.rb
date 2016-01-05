class Service < ActiveRecord::Base
  belongs_to :user

  validates :service_type, :presence => true
  validates :onsite_contact_name, :presence => true
  validates :onsite_contact_phone, :presence => true
  validates :company_name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zipcode, :presence => true

end
