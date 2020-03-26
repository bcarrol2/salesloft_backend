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

    def email_difference_percent(email, comparing_emails)
        close_enough = []

        comparing_emails.each { |compared_email|
            longer_email = [email.size, compared_email.size].max
            exact = email.each_char.zip(compared_email.each_char).select { |a,b| a == b }.size
            percent = (longer_email - exact) / email.size.to_f
            if percent < 0.6
                close_enough << compared_email unless percent === 0.0
            end
        }
        close_enough
    end

end
