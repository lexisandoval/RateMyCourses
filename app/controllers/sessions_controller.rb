class SessionsController < ApplicationController

  def home
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
    end
    redirect_to root_path
  end

end
