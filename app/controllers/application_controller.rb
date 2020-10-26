class ApplicationController < ActionController::Base
    def authenticate_user
      user_id = session[:user_id].to_i
      return true if current_user

      redirect_to new_session_path
    end

    def current_user
      user_id = session[:user_id].to_i
      User.find_by(id: user_id)
    end
end
