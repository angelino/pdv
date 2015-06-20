require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'validations' do
    subject { FactoryGirl.build(:product) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:price) }
  end
end
