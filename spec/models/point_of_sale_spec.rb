require 'rails_helper'

RSpec.describe PointOfSale, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:point_of_sale) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
