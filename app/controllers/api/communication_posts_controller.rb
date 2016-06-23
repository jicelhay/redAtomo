class Api::CommunicationPostsController < Api::APIController
	before_action :require_authentication!
	before_action :set_school_class, only: :index
	before_action :set_context, only: [:sign_comunication, :show]

	def index
	  @posts = @school_class.communication_posts
  	  render 'api/posts/communication_index', status: :ok 
	end

	def show
      render 'api/posts/communication_show', status: :ok
	end


	def sign_comunication
		@communication.signers << current_user
		render json: {}, status: :ok
	end

	private
		def set_school_class
			@school_class = SchoolClass.where(id: params[:classId]).take
		  unless @school_class.present?
		      bad_parameters
		      return
	 	  end
		end

		def set_context
			@communication = CommunicationPost.where(id: params[:postId]).take
			 unless @communication.present?
		      bad_parameters
		      return
	 	  end
		end
end