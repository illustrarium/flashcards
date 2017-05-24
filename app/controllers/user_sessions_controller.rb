class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
 
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:root, notice: 'Вы успешно вошли')
    else
      flash.now[:alert] = 'Не вошли!'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Вы успешно вышли!')
  end
end
