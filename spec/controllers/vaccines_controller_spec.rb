require 'rails_helper'

RSpec.describe VaccinesController, type: :controller do
  login_user

    describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET show" do
    it "has a 200 status code" do
      vaccine = create(:vaccine)
      get :show, params: { id: vaccine.id }
      expect(response).to be_successful
    end
  end
  # This should return the minimal set of attributes required to create a valid
  # Article. As you add validations to Article, be sure to adjust the attributes here as well.
  # let(:valid_attributes) {
  #     { :title => "Test title!", :description => "This is a test description", :status => "draft" }
  # }
  # let(:valid_session) { {} }
  # describe "GET #index" do
  #   it "assigns @vaccines" do
  #     create(:vaccine)
  #     get :index
  #     expect(assigns(:vaccines)).to eq([:vaccine])
  #   end
  #   it "renders the index template" do

  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end
end
