class CommentsController < ApplicationController
	before_action :set_context

	def new
		@comment = Comment.new
	end

	def create
		# Ajax in comments adapted from https://gemfile.wordpress.com/2014/03/06/rails-blog-comments-with-ajax/
		@comment = Comment.new(body: params[:comment][:body],
                     post_id: params[:post_id],
                     user_id: current_user.id)
		if @comment.save
			respond_to do |format|
				format.html do
					puts @comment.body
					redirect_to @comment
				end
				format.js
			end
		end

	end

	private
		def set_context
			@school_class = SchoolClass.find(params[:school_class_id])
			@post = Post.find(params[:post_id])
		end
end
