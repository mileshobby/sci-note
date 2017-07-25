require 'rails_helper'

RSpec.describe Api::SessionsController, type: :controller do

  describe "POST #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #destroy" do

  end

end
