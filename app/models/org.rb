class Org < ActiveRecord::Base


	has_many		:hosts
	has_many		:events, through: :hosts

	validates :name, presence: true, uniqueness: true, length: { in: 2..10 }

end