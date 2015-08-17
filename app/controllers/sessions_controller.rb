class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = login(session_params[:username], session_params[:password])
    if user
      render :json => { "result" => "Authentication Success", "user" => user.profile }
    else
      render :json => { "result" => "Authentication Failed" }, :status => :unauthorized
    end
  end

  def destroy
    logout
    render :json => { "result" => "destroyed" }
  end

  private 
    def session_params
      params.require(:user).permit(:username, :password)
    end
end
