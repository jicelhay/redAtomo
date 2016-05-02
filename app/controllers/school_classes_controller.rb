class SchoolClassesController < ApplicationController
before_filter :authenticate_user!
before_action :authenticate_teacher

def show

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

