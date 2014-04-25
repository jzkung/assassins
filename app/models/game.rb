class Game < ActiveRecord::Base
	has_many :players, class_name: "User"
end
