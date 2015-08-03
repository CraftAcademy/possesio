require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Fixtures' do
    it 'should have valid User Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end

    it 'should have valid Admin Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end


  describe 'Associations' do
    #it { is_expected.to have_many :invoices }
  end

  describe 'Database Schema' do
    #it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :email }
    #it { is_expected.to have_db_column :is_admin }
    # Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Validation' do
    subject { FactoryGirl.build(:user) }
    #it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('a@a.com', 'a@1b.net').for(:email) }
    it { is_expected.to_not allow_value('a@a', 'a@1b,net', '!d@e.se', 'd@a!.s0').for(:email) }
  end
end
