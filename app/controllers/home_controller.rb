class HomeController < ApplicationController
  def index
  @user = User.first
  sign_in(@user)
  end
end
