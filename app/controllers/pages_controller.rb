class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :maintenance, :confidentiality]

  def home
  end

  def maintenance
  end

  def confidentiality
  end
end
