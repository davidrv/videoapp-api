require 'rails_helper'

RSpec.describe ListVersion, type: :model do
  subject(:list_version) { FactoryBot.build(:list_version) }

  it { is_expected.to be_valid }
end
