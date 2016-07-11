class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def dashboard
    @users = User.all
  end

  def index
    
  end
end