class Api::ParentObligationController < Api::APIController
  before_action :require_authentication!
  before_action :set_school_class_code, only: :create
  before_action :set_parent_obligation, only: :destroy

  acts_as_token_authentication_handler_for User

  def create

    unless @school_class.present?
      bad_parameters
      return
    end

    @parent_obligation = ParentObligation.create(user_id: @user.id, school_class_id: @school_class.id)
    if @parent_obligation.save
      render 'api/users/show', status: :ok
    else
      render json: @parent_obligation.errors, status: :internal_server_error
    end
  end

  def destroy
    unless @parent_obligation.present?
      bad_parameters
      return
    end
    if @parent_obligation.destroy
      render 'api/users/show', status: :ok
    else
      render json: @parent_obligation.errors, status: :internal_server_error
    end
    
  end

  private

    def set_school_class_code
      @user = current_user
      @school_class = SchoolClass.where(securityCode: params[:securityCode]).take
    end

    def set_parent_obligation
      @user = current_user
      @parent_obligation = ParentObligation.where(user_id: @user.id,school_class_id: params[:classId]).take
    end
end