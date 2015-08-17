class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      render :json => { result: "success", user: user.profile } 
    else
      render :json => { result: "failed" }, :status => :bad_request
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :nickname, :image_url, :birth_date, :sex, :grade, :comment)
    end

end
