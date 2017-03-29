class Exercise < ApplicationRecord

	belongs_to :user

	has_and_belongs_to_many :etypes
	has_and_belongs_to_many :equipment
	has_and_belongs_to_many :muscles

	accepts_nested_attributes_for :etypes, allow_destroy: true, reject_if: proc {|att| att['name'].blank?}
end
