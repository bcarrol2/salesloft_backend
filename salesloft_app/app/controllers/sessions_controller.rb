class SessionsController < ApplicationController
  def new
    render component: 'Login'
  end

  def create
    user = User.find_by_email(params[:email])
    debugger
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    render component: 'Login', notice: "Logged out!"
  end
end
