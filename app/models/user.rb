class User < ApplicationRecord
  before_save { self.email = email.downcase }
	validates(:name, presence: true, length: {maximum: 50})
	VALID_EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	# validates :email, presence: true, length: {maximum: 255}, format: { with: /<regular expression>/ }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6}

	def User.digest(string)
		cost = ActiveModel:: SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end




# Presence test (name, email)
# Length test (name max 50, email max 255)
# Format test (valid + invalid addresses)
# Uniqueness test
# Downcasing test (callback check करने के लिए)