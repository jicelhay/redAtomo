class Api::UsersController < Api::APIController

  def login
    user_email  = params[:user][:email].presence
    @user = User.where(email: params[:user][:email]).take if user_email
    if @user.present? && @user.valid_password?(params[:user][:password])
      sign_in @user, store: false
    else
      bad_parameters
      return
    end
    render :show, status: :ok
  end

  def create
    @user = User.new(user_params)
    @user.teacher = false
    if @user.save
      sign_in @user, store: false
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end