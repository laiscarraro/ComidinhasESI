class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorized
      redirect_to '/login/index' unless logged_in?
    end

    def require_permission
      if current_user != User.find(session[:user_id])
        redirect_to root_path
      end
    end
end
