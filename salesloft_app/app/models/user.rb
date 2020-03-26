class User < ApplicationRecord
    validates :first_name, :last_name, length: { minimum: 2 }
    validates :email, uniqueness: true, confirmation: { case_sensitive: false }
    validates :email_confirmation, :password_confirmation, presence: true
    validates :password, confirmation: true, length: { minimum: 7 }
end
