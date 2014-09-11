class Rating < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip

	validates :rating, inclusion: { in: 1..5}
end
