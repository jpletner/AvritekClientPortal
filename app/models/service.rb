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

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }

  has_attached_file :inventory
  validates_attachment :inventory,
    :url => "/assets/uploads/:id/:content_type/:basename.:extension",
    :path => ":rails_root/public/assets/uploads/:id/:content_type/:basename.:extension",
    :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
    size: { in: 0..10.megabytes }

  has_attached_file :other_file1
  validates_attachment :other_file1,
    :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
    size: { in: 0..10.megabytes }

  # def self.search(search)
  #   if search
  #     where("lower(name) LIKE (?) OR lower(first_name) LIKE (?) OR lower(day_option2) LIKE (?)", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%" )
  #   else
  #     where(nil)
  #   end
  # end

end
