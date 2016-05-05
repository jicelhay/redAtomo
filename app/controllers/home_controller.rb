class HomeController < ApplicationController
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
end
