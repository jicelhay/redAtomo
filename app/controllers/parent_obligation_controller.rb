class ParentObligationController < ApplicationController
before_action :set_post

  def create
  end

  def delete
  end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @parent_obligation = ParentObligation.find(params[:id])
    end
end
