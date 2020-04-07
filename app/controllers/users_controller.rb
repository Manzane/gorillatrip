class UsersController < ApplicationController
  def show
  @user = current_user
  end

  def age
  end
end
