class Kill < ActiveRecord::Base
	belongs_to :target, class_name: "User", foreign_key: "target_id"
	belongs_to :assassin, class_name: "User", foreign_key: "assassin_id"
end
