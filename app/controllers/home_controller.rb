class HomeController < ApplicationController
  def index
    @user = User.first
    sign_in(@user)
    @school_class = current_user.school_classes.first
    @posts = @school_class.posts
    # En caso de crear un nuevo post:
    @post = Post.new
    @multimedia_post = MultimediaPost.new
  end

  def configuracion
    @school_class = SchoolClass.find(params[:school_class_id])

    respond_to do |format|
      format.js
    end
  end
end
