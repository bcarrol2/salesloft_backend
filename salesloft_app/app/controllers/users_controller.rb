class UsersController < ApplicationController

    def index
        @users = User.all
        if user_signed_in?
            user_email = current_user.email
        else
            user_email = User.first.email
            # There is no real need for this other than display purposes for non matching emails
        end
        all_emails_except_users = User.where.not(email: user_email).map { |p| p.email }
        user_email_characters
        @user_chars = count_email_characters(@email_characters).to_a 
        # changed to array strictly for react prerender 
        @close_to_emails = email_difference_percent(user_email, all_emails_except_users)
        # emails that are close to the user's
        render component: 'Users', 
            props: { 
                users: @users, 
                email_data: @user_chars, 
                email_comparison: @close_to_emails, 
                current_user_email: user_email
            }
    end

    def user_email_characters
        if user_signed_in?
            @email_characters = current_user.email.split('@')[0]
        else
            @email_characters = User.first.email.split('@')[0]
            # There is no real need for this other than display purposes
        end

        @counted_characters = count_email_characters(@email_characters)
    end

    def count_email_characters(email_string)
        # this method creates the hash for letters/symbols and count ex {r: 3}
        @counted = {}

        chars = email_string.split("")
        for char in chars
            if char == " "
            next
            elsif @counted.key? char
            @counted[char] = @counted[char] + 1   
            else
            @counted[char] = 1
            end
        end

        @counted
    end

    def email_difference_percent(email, comparing_emails)
        @close_enough = []

        comparing_emails.each { |compared_email|
            longer_email = [email.size, compared_email.size].max
            exact = email.each_char.zip(compared_email.each_char).select { |a,b| a == b }.size
            percent = (longer_email - exact) / email.size.to_f
            if percent <= 0.7
                @close_enough << compared_email unless percent === 0.0
                # unless 0.0 just being safe to not redisplay current user's email
            end
        }
        @close_enough
    end

end
