class Listing < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	

  extend FriendlyId
  friendly_id :name, use: :slugged
	#accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, :category, :description, :price, :category_id, :state, presence: { :message => 'Laukas privalomas' }
  validates :price, numericality: { :greater_than_or_equal_to => 1 }
  # validates :category_id, presence: true
  # validates :state, presence: true	

  has_many   :photos, :dependent => :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory


  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Listing.where(token: random_token).exists?
    end
  end


end
