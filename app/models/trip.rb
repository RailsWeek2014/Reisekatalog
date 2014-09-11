class Trip < ActiveRecord::Base
	has_many :ratings
	acts_as_taggable
	acts_as_taggable_on :tags

#	has_many :users,
#		through: :ratings
def avg_rating
	temp = 0.0
	ratings.each do |r|
		temp += r.rating		
	end
	result = (temp.to_f / ratings.where(rating: 1..5).count).round(2)
	unless  result.nan?
		result
	else
		"Not rated yet"
	end
end

def user_rating user

	begin
		ratings.find_by(user_id:user.id, trip_id:self.id).rating
	rescue Exception => e
		0.0
	end
end

#def set_user_rating user, rating
#	new_rating = Rating.new user: user , trip: self , rating: rating
#	
#end

end
