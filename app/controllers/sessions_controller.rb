class SessionsController < ApplicationController
  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to '/user'
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'You have successfully logged out!'
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
