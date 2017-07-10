class Token < ApplicationRecord
	validates :user, :token, :expires_at, presence: true
  belongs_to :user

  before_create :generate_token!

  def is_valid?
  	DateTime.now < expires_at
  end

  private

  def generate_token!
  	begin 
  		token = SecureRandom.hex
  	end while Token.where(token: self.token).any?
  	expires_at ||= 1.month.from_now
  end
end
