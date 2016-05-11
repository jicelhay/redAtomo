class HomeController < ApplicationController
  before_action :check_lti
  protect_from_forgery with: :null_session

  def index
    @user = User.first
    sign_in(@user)
    @school_class = current_user.school_classes.first
    @posts = @school_class.posts
    #TODO: activar filtro:
    #@selected = @posts.select { |post| post.type == 'multimedia' }
  end

  def configuracion
    @school_class = SchoolClass.find(params[:school_class_id])
    #TODO: activar filtro:
    #@selected = @posts.select { |post| post.type == 'aviso' }

    respond_to do |format|
        format.js
    end
  end

  private
    def check_lti
      if request.method == "POST"
        # Initialize TP object with OAuth creds and post parameters
        provider = IMS::LTI::ToolProvider.new("", "", params)

        # Verify OAuth signature by passing the request object
        if provider.valid_request?(request)
          # success
        else
          # handle invalid OAuth
          render :text => "Error LTI"
        end
      end
    end
end
