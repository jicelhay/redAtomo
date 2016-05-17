class Api::APIController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  before_action :set_default_response_format, :set_pagination
  before_filter :authenticate_user_from_token!

  acts_as_token_authentication_handler_for User


  def not_found
    render json: { error: '404 Not found' }, status: 404
  end

  def bad_parameters
    render json: { error: 'Parametros incorrectos' }, status: :unprocessable_entity
  end

  protected

  def set_default_response_format
    request.format = :json
    end

  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  def authenticate_user_from_token!
    user_id	= params[:user_id].presence
    user	= user_id && User.find(user_id)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user, store: false
  end
    end

  def set_pagination
    @page =	(!params[:page].nil?)	?	params[:page].to_i	: 1
    @per_page = (!params[:per_page].nil?)	?	params[:per_page].to_i	: 20
    end
end