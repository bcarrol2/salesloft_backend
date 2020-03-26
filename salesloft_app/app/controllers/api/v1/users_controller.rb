class Api::V1::UsersController < ApplicationController
    def index
        @user = User.first
    end

    def user_email_characters
        email_characters = @user.email.split('@')[0]
        counted_characters = count_email_characters(email_characters)

        email_data = {
            email_letters: email_characters,
            character_amount: counted_characters
        }

        render json: email_data
    end

    def count_email_characters(email_string)
        counted = {}

        chars = email_string.split("")
        for char in chars
            if char == " "
            next
            elsif counted.key? char
            counted[char] = counted[char] + 1   
            else
            counted[char] = 1
            end
        end

        counted
    end

end
