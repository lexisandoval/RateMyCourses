class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  private 

  def current_user
    # assigns current user once, won't call to database more than once
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] # session is set here from '/login'
  end

  def logged_in?
    !!current_user #truthy value of current user object
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view this page."
      redirect '/'
    end
  end

  # def authorized_edit?(sale)
  #   sale.user == current_user
  # end

  # def redirect_if_not_authorized(sale)
  #   if !authorized_edit?(sale)
  #     flash[:error] = "You may only review your own sales."
  #     redirect '/'
  #   end
  # end


end
