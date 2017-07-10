require 'rails_helper'

RSpec.describe Token, type: :model do
	it "has a valid factory" do
    expect(build(:token)).to be_valid
  end

  let(:token) { build(:token) }

  describe "ActiveModel validations" do    
    it { expect(token).to validate_presence_of(:token) }
    it { expect(token).to validate_presence_of(:expires_at) }
  end

  describe "ActiveRecord associations" do    
    it { expect(token).to belong_to(:user) }    
  end

  describe "Database table" do
    it { expect(token).to have_db_column(:expires_at).of_type(:datetime) }       
    it { expect(token).to have_db_column(:user_id).of_type(:integer) }       
    it { expect(token).to have_db_column(:token).of_type(:string) }       
    it { expect(token).to have_db_index([:user_id]) }
  end

  describe "Respond to its public methods" do
    context "#is_valid?" do
      context "When the token havent expire" do
        it { expect(token.is_valid?).to eq(true) }
      end
      context "When the token is expired" do
        before do
          allow(token).to receive(:expires_at).and_return(DateTime.now - 5.minute)
        end
        it { expect(token.is_valid?).to eq(false) }
      end
    end
  end
end
