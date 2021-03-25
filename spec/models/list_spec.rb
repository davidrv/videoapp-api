require 'rails_helper'

RSpec.describe List, type: :model do
  subject(:list) { FactoryBot.create(:list) }

  it { is_expected.to be_valid }
end
