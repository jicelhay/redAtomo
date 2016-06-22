class HomeController < ApplicationController
  #require 'ims/lti'
  #require 'oauth/request_proxy/rack_request'
  #OAUTH_10_SUPPORT = true

  before_action :check_lti
  #Not the best practice, but works. Should be fixed.
  skip_before_filter :verify_authenticity_token
  #before_filter :authenticate_user!, :except => :index

  def index
    #TODO: fix this
    if !current_user.present? and @LMS_user_id == nil
      render plain: "Debes acceder a redATOMO mediante Aula primero."
      return nil
    end

    #Check if user needs to be created.
    if !User.exists?(aula_id: @LMS_user_id)
      #TODO: fix this! (email must be unique)
      no_email = "no_hay_email_" + (@LMS_user_id).to_s + "@gmail.com"
      @user = User.create(name: "Profesor(a)",
        email: no_email,
        password: "0123456",
        password_confirmation: "0123456",
        aula_id: @LMS_user_id,
        teacher: true)
      #puts "Usuario valido?: " + (@user.valid?).to_s + " " + (@user[:aula_id]).to_s
      #puts "Error: " + (@user.errors.full_messages).to_s
    else
      @user = User.find_by(aula_id: @LMS_user_id)
    end

    if !current_user.present?
      sign_in(@user)
    end

    #Check if class needs to be created.
    if session[:context_id] == nil
      session[:context_id] = @LMS_context_id
    end
    if !SchoolClass.exists?(aula_id: session[:context_id])
      code = 'codigo_' + @LMS_user_id + "_" + @LMS_context_id
      @school_class = SchoolClass.create(securityCode: code,
        user_id: @user.id,
        school_id: 1,
        aula_id: session[:context_id],
        name: @LMS_context_title)
    else
      @school_class = SchoolClass.find_by(aula_id: session[:context_id])
    end
    #puts "Error user invalid: " + (@user.errors.full_messages).to_s
    @posts = @school_class.posts

    # En caso de crear un nuevo post o comentario:
    @post = Post.new
    @comment = Comment.new
    @multimedia_post = MultimediaPost.new

    # En caso de venir de la pestaña multimedia
    @multimedia = params[:multimedia]
  end

  def configuracion
    puts "Usuario: " + (current_user).to_s + " " + (user_signed_in?).to_s
    puts "context_id: " + (session[:context_id]).to_s
    @school_class = SchoolClass.find(params[:school_class_id])

    respond_to do |format|
      format.js
    end
  end

  private
    def check_lti
      if request.method == "POST" && params[:lti_message_type] == "basic-lti-launch-request"
        @LMS_context_title = params[:context_title]
        @LMS_context_id = params[:context_id]
        @LMS_user_id = params[:user_id]
        # # Initialize TP object with OAuth creds and post parameters
        # provider = IMS::LTI::ToolProvider.new("desafio.3.puc.sandoval", "desafio.3.puc.sandoval", params)


        # # Verify OAuth signature by passing the request object
        # if provider.valid_request?(request) || true
        #   # success
        # else
        #   # handle invalid OAuth
        #   render :text => "Error LTI"
        # end
      end
    end
end
