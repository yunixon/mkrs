class Listing < ActiveRecord::Base
	 mount_uploader :image, ImageUploader

	has_many    :photos, :dependent => :destroy
	
	accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, :category, :description, :price, presence: { :message => 'Laukas privalomas' }
  validates :price, numericality: { greater_than: 0 }
  belongs_to :user
  	
  belongs_to :category

  validates :category_id, presence: true



end
