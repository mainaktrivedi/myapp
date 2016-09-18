class Host < ActiveRecord::Base

	belongs_to :org
	has_many   :events

	validates :name, presence: true, uniqueness: true, length: { in: 2..50 }
	validates :org, presence: true

end