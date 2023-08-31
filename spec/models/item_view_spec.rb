require 'rails_helper'

RSpec.describe ItemView, type: :model do
  subject(:item_view) { FactoryBot.build(:item_view) }

  it { is_expected.to be_valid }
end
