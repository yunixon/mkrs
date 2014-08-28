class Listing < ActiveRecord::Base
 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "1.jpg"
 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"],
		  :storage => :dropbox,
		  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
end
