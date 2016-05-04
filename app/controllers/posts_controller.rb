class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_post!, only: [:new,:create]
  before_filter :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(title: params[:post][:title], body: params[:post][:body], school_class_id: params[:school_class_id], user_id: current_user.id)
    
    respond_to do |format|
      if @post.save
        puts @post.title
        format.html { redirect_to url_for(controller: :home, action: :index)}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to url_for(controller: :home, action: :index) }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title,:body,:school_class_id)
    end
    
    def authorize_post!
    #setear curso y ver si usuario logeado coincide con profesor del curso
      @school_class = SchoolClass.find(params[:school_class_id])
      unless current_user.equal?(@school_class.teacher) do
         controller.flash[:error] = "Debes ser profesor del curso para crear un nuevo anuncio"
         controller.redirect_to url_for(controller: :home, action: :index)
      end
    end
    end
    
end

