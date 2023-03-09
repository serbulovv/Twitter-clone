require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    context "when user is not signed in" do
      it "returns a successful response" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is signed in" do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
      end

      it "redirects to dashboard path" do
        get :index
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end
