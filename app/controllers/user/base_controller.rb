class User::BaseController < ApplicationController
  before_action :require_current_user

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
