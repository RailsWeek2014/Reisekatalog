class Trip < ActiveRecord::Base
	has_many :ratings

#	has_many :users,
#		through: :ratings
def avg_rating
	result = 0
	ratings.each do |r|
		result += r.rating		
	end
	result.to_f / ratings.count
end


end
