class Photo < ActiveRecord::Base

  #photo belongs to album
	belongs_to	:listing
	#validations
	validates 	:listing, presence: true
	# Photo uploader using carrierwave
  mount_uploader :image, ImageUploader


end
