class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  acts_as_messageable
  mount_uploader :profile_image, AvatarUploader

  extend FriendlyId
  friendly_id :user_name, use: :slugged
 
  validates :user_name, :email, presence: { :message => 'Laukas privalomas' }

  validates :user_name, format: { with: /[\w \.\-@]+/, message: "Galima naudoti tik raides ir sk." },  :length => { :minimum => 5, :maximum => 40, :message => 'should be between 7 and 40 characters' }

 validates_uniqueness_of :user_name



  has_many :listings, dependent: :destroy

  # Avatar uploader





  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable



  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          user_name: auth.extra.raw_info.name.delete(' '),
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20],
          remote_profile_image_url: auth[:info][:image],
          gender: auth.extra.raw_info.gender,
          provider: auth.provider,
          facebook_url: auth.info.urls.Facebook
        )
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def name
    email
  end

  def mailboxer_email(object)
    email
  end

end
