class Api::V1::UsersController < ApplicationController
    def index
        @user = User.first
    end

    def user_email_characters
        email_characters = @user.email.split('@')[0] 
    end

end
