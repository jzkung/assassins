class User < ActiveRecord::Base
	belongs_to :game
	belongs_to :target, class_name: "User", foreign_key: "assassin_id"
	belongs_to :assassin, class_name: "User", foreign_key: "target_id"
	has_many :kills
	has_many :messages
	scope :player, -> {where role: 'player'}
	scope :admin, -> {where role: 'admin'}
	scope :mod, -> {where role: 'mod'}

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	#validates :email, uniqueness: true
	validates :password, presence: true
	validates :login, uniqueness: true
	validates :password, confirmation: true
	@password

	def full_name
		"#{first_name} #{last_name}"
	end

	def is_admin?
		role == 'admin'
	end

	def valid_password?(candidate_pass)
		candidate_pass == password
	end

	def valid_kill_code?(kill_code_in)
		kill_code_in == kill_code
	end
end
