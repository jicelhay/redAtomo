class Api::APIController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_default_response_format

  acts_as_token_authentication_handler_for User, fallback_to_devise: false


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

  # https://github.com/gonzalo-bulnes/simple_token_authentication/issues/154
  def require_authentication!
      throw(:warden, scope: :user) unless current_user.presence
  end

  def set_pagination
    @page =	(!params[:page].nil?)	?	params[:page].to_i	: 1
    @per_page = (!params[:per_page].nil?)	?	params[:per_page].to_i	: 6
  end

end