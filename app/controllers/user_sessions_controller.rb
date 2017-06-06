class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
 
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:root, notice: t(".login_success"))
    else
      flash.now[:alert] = t(".login_failed")
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: t("logout_success"))
  end
end
