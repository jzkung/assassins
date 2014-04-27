class Game < ActiveRecord::Base
	has_many :players, class_name: "User"
	has_many :mods, class_name: "User"

	validates :name, presence: true
	validates :code, presence: true
	validates :code, uniqueness: true
	validates :reg_start, presence: true
	validates :reg_end, presence: true
	validates :game_start, presence: true
end
