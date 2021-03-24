require 'rails_helper'

RSpec.describe Subscription, type: :model do
  subject(:subscription) { FactoryBot.create(:subscription) }

  it { is_expected.to be_valid }

  describe "#plan" do
    it "returns the default Plan after creating" do
      expect(subject.plan).to eq(Plan::FREE)
    end
  end
end
