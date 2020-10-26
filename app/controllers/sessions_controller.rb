class SessionsController < ApplicationController
  def new
    redirect_to recipes_path if session[:user_id]
  end

  def create
    user = User.find_by email: params['email']
    if user && user.authenticate(params['password'])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
