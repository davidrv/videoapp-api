require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { FactoryBot.create(:user) }

  subject(:list) { FactoryBot.build(:list, user: user) }

  it { is_expected.to be_valid }

  describe "validations" do
    describe "#max_lists" do
      before do
        allow(user).to receive(:plan).and_return(Plan::STANDARD)

        user.plan.max_lists.times do |n|
          FactoryBot.create(:list, user: user)
        end
      end

      it { is_expected.to_not be_valid }
    end
  end
end
