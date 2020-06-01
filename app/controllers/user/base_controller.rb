class User::BaseController < ApplicationController
  before_action :require_current_user, except: [:new, :index, :create]

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
