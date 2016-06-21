class CommentsController < ApplicationController
	before_action :set_context

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(body: params[:comment][:body],
                     post_id: params[:post_id],
                     user_id: current_user.id)
		if @comment.save
			redirect_to @comment
		end
	end

	private
		def set_context
			@school_class = SchoolClass.find(params[:school_class_id])
			@post = Post.find(params[:post_id])
		end
end
