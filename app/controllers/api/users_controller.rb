class Api::UsersController < Api::APIController

  def login
    user_email  = params[:user_email].presence
    @user = User.where(email: user_email).take if user_email
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if @user
      sign_in @user, store: true
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
      sign_in @user, store: true
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