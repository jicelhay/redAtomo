class Api::PostsController < Api::APIController
 before_action :require_authentication!
 before_action :set_school_class_code, only: :index
 before_action :set_post, only: :like_post


 def index
    @posts = @school_class.posts
    render :index, status: :ok
  end

  def like_post
   @like = Like.create(user_id: current_user.id, post_id: @post.id)
   if @like.save
            render json: {}, status: :ok
        else
            render json: @like.errors, status: :internal_server_error
        end
  end

	private

	def set_post
	  @post = Post.where(id: params[:postId]).take
	  unless @post.present?
	  bad_parameters
	  return
	  end
	end

	def set_school_class_code
	  @school_class = SchoolClass.where(id: params[:classId]).take
	  unless @school_class.present?
      bad_parameters
      return
    end

	end
end

