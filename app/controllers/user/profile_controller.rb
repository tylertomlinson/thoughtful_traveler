class User::ProfileController < User::BaseController
  def edit
    @user = current_user
  end

  def update
    begin
      current_user.update!(user_params)
      redirect_to user_path
    rescue ActiveRecord::RecordInvalid
      flash[:error] = errors.messages
      render edit
    end
  end

end
