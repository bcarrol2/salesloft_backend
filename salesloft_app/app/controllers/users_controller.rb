class UsersController < ApplicationController
    before_action :require_login

    def index
        @users = User.all
        # render json: @users
        render component: 'Users', props: { users: @users }
    end

    def show
        @user = User.find(params[:id])
    end

    def create
    end
    
    def login_user
        user = User.find_by(params[:email])
        # debugger
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

    def scroll
        myparams = { page: params[:page], per_page: params[:per_page] }
        users = User.where("description ILIKE #{params[:term]}").paginate(myparams)
        
        response = {users: users, total: users.all.size}
        return render json: response
    end

    private

    def require_login
        render component: 'Login'
    end

end
