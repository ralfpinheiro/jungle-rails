class User < ActiveRecord::Base
    has_secure_password
    
    has_many :reviews

    validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }

    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email.downcase.strip)
        # If the user exists AND the password entered is correct.
        if user && user.authenticate(password)
          # Save the user id inside the browser cookie. This is how we keep the user
          user
        else
          nil
        end
      end


end

