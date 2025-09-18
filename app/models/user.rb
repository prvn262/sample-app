class User < ApplicationRecord
	attr_accessor :remember_token
  before_save { self.email = email.downcase }
	validates(:name, presence: true, length: {maximum: 50})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	# validates :email, presence: true, length: {maximum: 255}, format: { with: /<regular expression>/ }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6}

  # Returns the hash digest of the given string.
	def self.digest(string)
		cost = ActiveModel:: SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	#Return a random token:
	def self.new_token
		SecureRandom.urlsafe_base64
	end

  # Remembers a user in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end
end




# Presence test (name, email)
# Length test (name max 50, email max 255)
# Format test (valid + invalid addresses)
# Uniqueness test
# Downcasing test (callback check करने के लिए)
