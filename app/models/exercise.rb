class Exercise < ApplicationRecord

	has_and_belongs_to_many :etypes
	has_and_belongs_to_many :equipment
	has_and_belongs_to_many :muscles
end
