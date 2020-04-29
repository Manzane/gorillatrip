require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  login_user

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response).to be_successful
    end
  end

#   describe 'GET #new' do
#   it 'assigns a new document to @documents' do
#     get :new
#     expect(assigns(:document)).to be_a_new(Document)

#   end
# end

  # describe "GET show" do
  #   it "has a 200 status code" do
  #     document = create(:document, user_id: subject.current_user.id)
  #     get :show, params: { id: document.id }
  #     expect(response).to be_successful
  #   end
  # end
end
