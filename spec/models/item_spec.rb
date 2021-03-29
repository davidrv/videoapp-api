require 'rails_helper'

RSpec.describe Item, type: :model do
  subject(:item) { FactoryBot.build(:item) }

  it { is_expected.to be_valid }

  describe "validations" do
    let(:user) { list.user }

    describe "#max_items" do
      let(:list) { item.list }

      before do
        user.plan.max_items.times do |n|
          FactoryBot.create(:item, list: list)
        end
      end

      it { is_expected.to_not be_valid }
    end
  end
end
