class User < ApplicationRecord
	validates :email, :provider, :uid, presence: true

	has_many :tokens
end
