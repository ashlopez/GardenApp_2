class User
  include Mongoid::Document
  
  field :user_name, type: String
  field :email, type: String

  field :password_digest, type: String
  attr_reader :password
  has_and_belongs_to_many :garden

  


 # This method uses bycrypt gem to encrypt password but does not save & encrypt and empty string
  def password=(unencrypted_password)
    unless unencrypted_password.empty?
  		 @password = unencrypted_password
  		 self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end  

# This method uses bycrypt gem to authenticate user password when logging in 
  def authenticate(unencrypted_password)
    logger.debug(unencrypted_password)
    logger.debug(self)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
 	      return self
      else
        return false
    end
  end

end
