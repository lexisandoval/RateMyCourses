class SessionsController < ApplicationController

  def destroy
    if session[:user_id]
      session.delete :user_id
    end
    redirect_to root_path
  end

  def create 
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Login failed: The information provided was incorrect."
      redirect_to login_path
    end
  end

end
