class User < ActiveRecord::Base
	has_many :ratings

	has_many :trips,
		through: :ratings

  #attr_protected :admin


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def admin?
  	self.admin
  end
end
