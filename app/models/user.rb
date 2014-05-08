class User < ActiveRecord::Base
	belongs_to :game
	belongs_to :target, class_name: "User", foreign_key: "assassin_id"
	belongs_to :assassin, class_name: "User", foreign_key: "target_id"
	has_many :kills
	scope :player, -> {where role: 'player'}
	scope :admin, -> {where role: 'admin'}
	scope :mod, -> {where role: 'mod'}

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password, presence: true
	validates :login, uniqueness: true
	validates :password, confirmation: true
	@password

	def full_name
		"#{first_name} #{last_name}"
	end

	def password
		@password
	end

	def password=(password)
		@password = password
		self.salt = rand()
		self.password_digest = Digest::SHA1.hexdigest("#{password}#{self.salt}")
	end

	def valid_password?(candidate_pass)
		Digest::SHA1.hexdigest("#{candidate_pass}#{self.salt}") == password_digest
	end
end
