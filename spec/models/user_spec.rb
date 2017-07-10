require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  let(:user) { build(:user) }

  describe "ActiveModel validations" do
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:uid) }
    it { expect(user).to validate_presence_of(:provider) }
  end

  describe "ActiveRecord associations" do
    it { expect(user).to have_many(:tokens) }
  end

  describe "Database table" do
    it { expect(user).to have_db_column(:name).of_type(:string) }    
    it { expect(user).to have_db_column(:email).of_type(:string) }    
    it { expect(user).to have_db_column(:provider).of_type(:string) }    
    it { expect(user).to have_db_column(:uid).of_type(:string) }
  end
end
