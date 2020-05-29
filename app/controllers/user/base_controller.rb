class User::BaseController < ApplicationController
  # code

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
