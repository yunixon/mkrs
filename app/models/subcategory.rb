class Subcategory < ActiveRecord::Base
	mount_uploader :hero_image, CategoryUploader

	extend FriendlyId
  	friendly_id :name, use: :slugged

	has_many :listings
	belongs_to :category

end
