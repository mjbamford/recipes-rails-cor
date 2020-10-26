class SessionsController < ApplicationController
  before_action :set_session, only: [:destroy]

  def create
    user = User.find_by email: params['email']
    if user && user.authenticate(params['password'])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:new, :create, :destroy)
    end
end
