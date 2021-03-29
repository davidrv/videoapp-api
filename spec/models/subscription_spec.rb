require 'rails_helper'

RSpec.describe Subscription, type: :model do
  subject(:subscription) { FactoryBot.create(:subscription) }

  it { is_expected.to be_valid }

  describe "#plan" do
    it "returns the default FREE plan after creating" do
      expect(subject.plan).to eq(Plan::FREE)
    end

    it "has the proper plan when specifying a custom one" do
      subscription = FactoryBot.create(:subscription, plan_id: "STANDARD")

      expect(subscription.plan).to eq(Plan::STANDARD)
    end
  end
end
