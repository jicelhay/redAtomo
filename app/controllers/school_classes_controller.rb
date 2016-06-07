class SchoolClassesController < ApplicationController
skip_before_filter :verify_authenticity_token
before_filter :authenticate_user!
before_action :authenticate_teacher

def show
  redirect_to url_for(controller: :home, action: :index) and return
end

def update
  respond_to do |format|
      update_class = @school_class.update(name: params[:school_class][:name], securityCode: params[:school_class][:securityCode])
      update_teacher = @school_class.teacher.update(name: params[:user][:name], email: params[:user][:email])
      if update_class && update_teacher
        format.html { redirect_to @school_class, notice: 'Datos de curso actualizado' }
        format.json { render :show, status: :ok, location: @school_class }
      else
        format.html { render :edit }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
end

def set_school_class
  @school_class = SchoolClass.find(params[:id])
end

def authenticate_teacher
#setear curso y ver si usuario logeado coincide con profesor del curso
    set_school_class
    unless current_user.equal?(@school_class.teacher) do
        controller.flash[:error] = "Debes ser profesor del curso para acceder a esta acción"
        controller.redirect_to url_for(controller: :home, action: :index)
    end
end
end
end
