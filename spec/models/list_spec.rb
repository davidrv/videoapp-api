# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  subject(:list) { FactoryBot.build(:list) }

  it { is_expected.to be_valid }

  describe 'validations' do
    let(:user) { list.user }

    describe '#max_lists' do
      before do
        allow(user).to receive(:plan).and_return(Plan::STANDARD)

        user.plan.max_lists.times do |_n|
          FactoryBot.create(:list, user: user)
        end
      end

      context 'when creating' do
        it { is_expected.to_not be_valid }
      end

      context 'when updating' do
        let(:updated_list) { user.lists.last }

        before { updated_list.update(name: Faker::Space.nasa_space_craft) }

        it 'expects list to be valid' do
          expect(updated_list).to be_valid
        end
      end
    end
  end
end
