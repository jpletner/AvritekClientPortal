class Service < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy

  accepts_nested_attributes_for :pictures, allow_destroy: true

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
    size: { in: 0..10.megabytes },
    :content_type => { :content_type => %w(application/zip application/rtf application/pdf application/msword application/vnd.ms-excel application/doc application/xls application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.openxmlformats-officedocument.spreadsheetml.sheet text/plain) }

  has_attached_file :other_file1
  validates_attachment :other_file1,
    size: { in: 0..10.megabytes },
    :content_type => { :content_type => %w(application/zip application/rtf application/pdf application/msword application/vnd.ms-excel application/doc application/xls application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.openxmlformats-officedocument.spreadsheetml.sheet text/plain) }

  # def self.search(search)
  #   if search
  #     where("lower(name) LIKE (?) OR lower(first_name) LIKE (?) OR lower(day_option2) LIKE (?)", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%" )
  #   else
  #     where(nil)
  #   end
  # end

end
