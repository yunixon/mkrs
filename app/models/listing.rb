class Listing < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	has_many    :photos, :dependent => :destroy
	
	# enable nested attributes for photos through listing class
	accepts_nested_attributes_for :photos, allow_destroy: true

	validates :name, :description, :price, presence: true
  	validates :price, numericality: { greater_than: 0 }
  	belongs_to :user




end
