class Listing < ActiveRecord::Base
 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "1.jpg",
		  :storage => :dropbox,
		  :dropbox_credentials => Rails.root.join("config/dropbox.yml")
end
