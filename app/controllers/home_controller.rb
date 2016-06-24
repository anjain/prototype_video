class HomeController < ApplicationController
  def index
    @users = User.active_users
  end
end