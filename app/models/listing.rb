class Listing < ActiveRecord::Base
 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png),
		  :storage => :dropbox,
		  :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
		  :dropbox_options => {
                               :path => proc { |style| "photos/#{style}/#{id}_#{avatar.original_filename}"}
                              }
end
