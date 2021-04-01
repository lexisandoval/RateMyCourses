class SessionsController < ApplicationController

  def home
    if logged_in?
      redirect_to ratings_path
    else
      render :'sessions/home'
    end
  end 

  def destroy
    session.clear
    redirect_to root_path
  end

  def create 
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to ratings_path
    else
      flash[:error] = "Login failed: The information provided was incorrect."
      redirect_to login_path
    end
  end

end
