class User < ActiveRecord::Base
	belongs_to :game
	belongs_to :target, class_name: "User", foreign_key: "assassin_id"
	belongs_to :assassin, class_name: "User", foreign_key: "target_id"
	has_many :kills
	has_many :messages
	scope :player, -> {where role: 'player'}
	scope :admin, -> {where role: 'admin'}
	scope :mod, -> {where role: 'mod'}

	@password

	def self.create_with_omniauth(auth)
	    create! do |user|
	      user.provider = auth['provider']
	      user.uid = auth['uid']
	      if auth['info']
	         user.name = auth['info']['name'] || ""
	         user.email = auth['info']['email'] || ""
	      end
	    end
	    #UserMailer.welcome_email(@user).deliver
	  end

	def full_name
		name
	end

	def is_admin?
		role == 'admin'
	end
	
	def valid_kill_code?(kill_code_in)
		kill_code_in == kill_code
	end
end
