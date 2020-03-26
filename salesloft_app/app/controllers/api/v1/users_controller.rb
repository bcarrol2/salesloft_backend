class Api::V1::UsersController < ApplicationController
    def index
        @user = User.first
    end

    def user_email_characters
        email_characters = @user.email.split('@')[0]
        render json: email_characters
    end

    def count_letters(user_email_characters)
        counted = {}

        chars = user_email_characters.split("")
        for char in chars
            if char == " "
            next
            elsif counted.has_key? char
            counted[char] = counted[char] + 1   
            else
            counted[char] = 1
            end
        end

        render json: counted
    end

end
