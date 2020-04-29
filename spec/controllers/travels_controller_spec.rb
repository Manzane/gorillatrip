require 'rails_helper'

RSpec.describe TravelsController, type: :controller do
  login_user

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET show" do
    it "has a 200 status code" do
      travel = create(:travel, user_id: subject.current_user.id)
      get :show, params: { id: travel.id }
      expect(response).to be_successful
    end
  end
end
