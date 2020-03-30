require 'bcrypt'

class User < ApplicationRecord
    include BCrypt
    has_secure_password
    validates :first_name, :last_name, length: { minimum: 2 }
    validates :email, uniqueness: true, confirmation: { case_sensitive: false }
    validates :password, confirmation: true, length: { minimum: 7 }

#   def password
#     @password ||= Password.new(password_hash)
#   end

#   def password=(new_password)
#     @password = Password.create(new_password)
#     self.password_hash = @password
#   end
end
