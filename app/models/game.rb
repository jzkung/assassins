class Game < ActiveRecord::Base
	has_many :players, class_name: "User"
	has_many :admins, class_name: "User"
	has_many :kills
	has_many :messages

	validates :name, presence: true
	validates :code, presence: true
	validates :code, uniqueness: true

	def has_ended?
		num_alive == 1
	end
end
