class Api::CommentsController < Api::APIController
	before_action :set_context
	before_action :require_authentication!

	def create
		@comment = Comment.new(body: params[:body],
                     post_id: @post.id,
                     user_id: current_user.id,
                     flagged: false)
		if @comment.save
            render json: {}, status: :ok
        else
            render json: @comment.errors, status: :internal_server_error
        end
	end

	def index
		@comments = @post.comments
	end

	private
		def set_context
			@post = Post.find(params[:post_id])
			unless @post.present?
			  bad_parameters
		  return
		  end
		end
end