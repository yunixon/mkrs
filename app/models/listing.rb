class Listing < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :images
	accepts_nested_attributes_for :images, allow_destroy: true

	validates :name, :description, :price, presence: true
  	validates :price, numericality: { greater_than: 0 }
  	belongs_to :user
  	belongs_to :category


end
