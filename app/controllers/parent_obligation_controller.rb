class ParentObligationController < ApplicationController
before_action :set_parent

  def create
  end

  def destroy
    @parent_obligation.destroy
    respond_to do |format|
    format.html { redirect_to url_for(controller: :home, action: :index)}
    #format.json { render :show, status: :created, location: @post }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent_obligation = ParentObligation.where(user_id: params[:id], school_class_id: params[:school_class_id]).take
    end
end
