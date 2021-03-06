require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(email:"myemail@bloc.com", password: "password")}

  describe "attributes" do
    it "has email attribute" do
      expect(user).to have_attributes(email: user.email)
    end
  end

  describe "roles" do
    it "is standard by default" do
      expect(user.standard?).to be_truthy
    end
  end
end
