class User::DashboardController < User::BaseController
  def index
    @user = current_user    
  end

  def edit; end
end
