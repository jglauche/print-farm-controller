class Backend < ActiveRecord::Base
	scope :active, where("is_active=1")

end
