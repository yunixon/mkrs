class Category < ActiveRecord::Base
	mount_uploader :hero_image, CategoryUploader

	extend FriendlyId
  	friendly_id :name, use: :slugged


	has_many :listings
	has_many :subcategories

end
