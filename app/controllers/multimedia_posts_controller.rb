class MultimediaPostsController < ApplicationController
  before_action :set_multimedia_post, only: [:show, :edit, :update, :destroy]

  # GET /multimedia_posts
  # GET /multimedia_posts.json
  def index
    @multimedia_posts = MultimediaPost.all
  end

  # GET /multimedia_posts/1
  # GET /multimedia_posts/1.json
  def show
  end

  # GET /multimedia_posts/new
  def new
    @multimedia_post = MultimediaPost.new
  end

  # GET /multimedia_posts/1/edit
  def edit
  end

  # POST /multimedia_posts
  # POST /multimedia_posts.json
  def create
    @multimedia_post = MultimediaPost.new(multimedia_post_params)
    if @multimedia_post.img_file_name.include? ".mp4"
      @multimedia_post.update(:is_video => true)
      @multimedia_post.update(:video => true)
    else
      @multimedia_post.update(:is_video => false)
      @multimedia_post.update(:video => false)
    end

    @school_class = SchoolClass.find(params[:school_class_id])
    @multimedia_post.school_class = @school_class

    respond_to do |format|
      if @multimedia_post.save
        format.html { redirect_to root_path(multimedia: true) }
        format.json { render :show, status: :created, location: @multimedia_post }
      else
        format.html { redirect_to url_for(controller: :home, action: :index) }
        format.json { render json: @multimedia_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia_posts/1
  # PATCH/PUT /multimedia_posts/1.json
  def update
    respond_to do |format|
      if @multimedia_post.update(multimedia_post_params)
        format.html { redirect_to @multimedia_post, notice: 'Multimedia post was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedia_post }
      else
        format.html { render :edit }
        format.json { render json: @multimedia_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia_posts/1
  # DELETE /multimedia_posts/1.json
  def destroy
    @multimedia_post.destroy
    respond_to do |format|
      format.html { redirect_to root_path(multimedia: true) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedia_post
      @multimedia_post = MultimediaPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multimedia_post_params
      params.require(:multimedia_post).permit(:title, :img)
    end
end
