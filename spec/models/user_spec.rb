require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  it { is_expected.to be_valid}

  describe "#create_default_subscription" do
    it "expects to create a default subscription when creating a user" do
      expect(user.subscriptions.count).to eq(1)

      puts user.subscriptions.first.attributes
      puts user.subscriptions.first.plan
    end
  end
end
