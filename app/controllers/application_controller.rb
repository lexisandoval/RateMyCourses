class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :authorized_edit?

  private 

  def current_user
    # assigns current user once, won't call to database more than once
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] # session is set here from '/login'
  end

  def logged_in?
    !!current_user 
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view this page."
      redirect_to root_path
    end
  end

  def authorized_edit?(rating)
    rating.user == current_user
  end

  def redirect_if_not_authorized(rating)
    if rating == nil || !authorized_edit?(rating)
      flash[:error] = "You may only review your own ratings."
      redirect_to ratings_path
    end
  end

end
