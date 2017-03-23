class User < ApplicationRecord

	has_many :etypes
	has_many :muscles
	has_many :equipment
	has_many :exercises
	has_many :routines
	has_many :workouts
	has_many :measurements

end
