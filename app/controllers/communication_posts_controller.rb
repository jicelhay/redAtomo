class CommunicationPostsController < ApplicationController
  before_action :set_communication_post, only: [:show, :edit, :update, :destroy]

  # GET /communication_posts
  # GET /communication_posts.json
  def index
    @communication_posts = CommunicationPost.all
  end

  # GET /communication_posts/1
  # GET /communication_posts/1.json
  def show
  end

  # GET /communication_posts/new
  def new
    @communication_post = CommunicationPost.new
  end

  # GET /communication_posts/1/edit
  def edit
  end

  # POST /communication_posts
  # POST /communication_posts.json
  def create
    @communication_post = CommunicationPost.new(communication_post_params)
    @school_class = SchoolClass.find(params[:school_class_id])
    @communication_post.school_class = @school_class

    pdf_path = communication_post_params[:pdf].path
    page_indexed_path = pdf_path + '[0]' # first page in PDF
    pdf_page = Magick::Image.read(page_indexed_path).first
    # Es necesario escribir un archivo, al ponerle extension jpg hace la conversion
    pdf_page.write("/tmp/redatomo-pdf-thumbnail.jpg")
    file = File.open("/tmp/redatomo-pdf-thumbnail.jpg")
    @communication_post.thumbnail = file
    file.close

    pdf_base64 = Base64.encode64(open("/tmp/redatomo-pdf-thumbnail.jpg") { |io| io.read })
    @communication_post.pdf_base64 = pdf_base64

    respond_to do |format|
      if @communication_post.save
        format.html { redirect_to root_path(communication: true) }
        format.json { render :show, status: :created, location: @communication_post }
      else
        format.html { render :new }
        format.json { render json: @communication_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communication_posts/1
  # PATCH/PUT /communication_posts/1.json
  def update
    respond_to do |format|
      if @communication_post.update(communication_post_params)
        format.html { redirect_to @communication_post, notice: 'Communication post was successfully updated.' }
        format.json { render :show, status: :ok, location: @communication_post }
      else
        format.html { render :edit }
        format.json { render json: @communication_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communication_posts/1
  # DELETE /communication_posts/1.json
  def destroy
    @communication_post.destroy
    respond_to do |format|
      format.html { redirect_to root_path(communication: true) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication_post
      @communication_post = CommunicationPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def communication_post_params
      params.require(:communication_post).permit(:title, :pdf)
    end
end
