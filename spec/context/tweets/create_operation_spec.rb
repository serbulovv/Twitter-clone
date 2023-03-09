require "rails_helper"

RSpec.describe Tweets::CreateOperation do
  let(:operation) { subject }

  describe "Tweets creation" do
    context "when tweet was successfully created" do
      let(:user) { FactoryBot.create(:user) }
      let(:params) do
        ActionController::Parameters.new(
          {
            text: Faker::Books::Lovecraft.paragraph_by_chars(characters: 200)
          }
        )
      end

      it "returns successfuly created tweet" do
        result = operation.call(params, user)
        expect(result).to be_success
      end

      it "returns successfuly created tweet with right user" do
        result = operation.call(params, user)
        expect(result.object.user).to eq(user)
      end

      it "returns successfuly created tweet with right text" do
        result = operation.call(params, user)
        expect(result.object.text).to eq(params["text"])
      end

      it "change Tweet count by 1" do
        expect { operation.call(params, user) }.to change(Tweet, :count).by(1)
      end
    end

    context "when tweet wasn't created" do
      let(:user) { FactoryBot.create(:user) }
      let(:params) do
        ActionController::Parameters.new(
          {
            text: Faker::Books::Lovecraft.paragraph_by_chars(characters: 260)
          }
        )
      end
      let(:wrong_params) do
        ActionController::Parameters.new(
          {
            text: Faker::Books::Lovecraft.paragraph_by_chars(characters: 300)
          }
        )
      end

      it "returns failure coz tweet text out of bound (more that 280 characters)" do
        result = operation.call(wrong_params, user)
        expect(result).not_to be_success
      end

      it "returns failure coz there is not such user" do
        user.id = 9_999_999
        result = operation.call(params, user)
        expect(result).not_to be_success
      end
    end
  end
end
