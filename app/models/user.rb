class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  ## Database authenticatable
  field :email,              :type => String, :null => false, :default => ""
  field :encrypted_password, :type => String, :null => false, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes
  index :email, :unique => true
  field :name
  validates_presence_of :name
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  embeds_many :documents

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  data = access_token.extra.raw_info
  if user = self.where(email: data.email).first
    user
  else # Create a user with a stub password.
    self.create(:email => data.email, :password => Devise.friendly_token[0,20])
  end
end
def self.find_for_open_id(access_token, signed_in_resource=nil)
  data = access_token.info
  if user = User.where(:email => data["email"]).first
    user
  else
    User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
  end
end
def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
  data = access_token.extra.raw_info
  if user = User.where(:username => data.screen_name).first
        user
    else
        User.create!(:email => "#{data.screen_name}@foo.bar", :username => data.screen_name, :password => Devise.friendly_token)
    end
end
end
