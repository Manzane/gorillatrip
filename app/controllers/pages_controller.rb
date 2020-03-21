class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :maintenance]

  def home
  end

  def maintenance
  end
end
