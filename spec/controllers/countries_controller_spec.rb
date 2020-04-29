require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  login_user

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response).to be_successful
    end
  end
end
