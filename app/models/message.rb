class Message < ActiveRecord::Base
	belongs_to :player, class_name: "User"
	belongs_to :game

	validates :content, presence: true
end
