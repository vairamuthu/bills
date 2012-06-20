class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  
  validates :username, :uniqueness => true,
          :length => { :within => 4..12 }
  protected
def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  login = conditions.delete(:name) 
  where(conditions).where(["lower(name) = :value", { :value => login.downcase }]).first
end
end
