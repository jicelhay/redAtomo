class Api::MultimediaPostsController < Api::APIController
	before_action :set_school_class
	before_action :require_authentication!

	def pictures
		@posts = @school_class.multimedia_posts.paginate(page: @page, per_page: @per_page)
		render 'api/posts/multimedia_index', status: :ok
	
	end

	def videos
		@posts = @school_class.multimedia_posts.where(video: true).paginate(page: @page, per_page: @per_page)
        render 'api/posts/multimedia_index', status: :ok	 
	end

	private

		def set_school_class
			@school_class = SchoolClass.where(id: params[:classId]).take
		  unless @school_class.present?
		      bad_parameters
		      return
	 	  end
		end

end
