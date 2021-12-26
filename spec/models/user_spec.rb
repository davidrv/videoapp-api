# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  it { is_expected.to be_valid }

  describe '#plan' do
    it 'expects to have the FREE plan after creating a user' do
      expect(user.plan).to eq(Plan::FREE)
    end

    it 'has the proper plan when creating a subscription' do
      FactoryBot.create(:subscription, user: user, plan_id: 'STANDARD')

      expect(user.plan).to eq(Plan::STANDARD)
    end
  end

  describe '#user_items_count' do
    subject(:user_items_count) { user.user_items_count }

    let(:list) { FactoryBot.create(:list, user: user) }

    before { 7.times { FactoryBot.create(:item, list: list) } }

    it { is_expected.to eq(7) }
  end
end
