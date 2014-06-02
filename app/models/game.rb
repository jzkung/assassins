class Game < ActiveRecord::Base
	has_many :players, class_name: "User"
	has_many :mods, class_name: "User"
	has_many :kills
	has_many :messages

	validates :name, presence: true
	validates :code, presence: true
	validates :code, uniqueness: true
end
