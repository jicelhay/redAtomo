class HomeController < ApplicationController
  def index
    @user = User.first
    sign_in(@user)
    @school_class = current_user.school_classes.first
    @posts = @school_class.posts
  end
end
