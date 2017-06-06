class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    if current_user
      redirect_to current_user, alert: 'Вы не можете создавать пользователей.'
    else
      @user = User.new
      @available_locales = []
      i = 0

      while i < I18n.available_locales.count # count of locales
        @available_locales << [I18n.available_locales[i - 1].to_s, I18n.available_locales[i - 1].to_s.upcase] # push locales to arr
        i += 1
      end
    end
  end

  def edit
    @available_locales = []
    i = 0

    while i < I18n.available_locales.count # count of locales
      @available_locales << [I18n.available_locales[i - 1].to_s, I18n.available_locales[i - 1].to_s.upcase] # push locales to arr
      i += 1
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: t(".success_sign_up")
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t(".success_update")
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: t(".user_deleted")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:locale, :email, :password, :password_confirmation)
  end
end
