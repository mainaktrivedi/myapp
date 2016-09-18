class Event < ActiveRecord::Base

	belongs_to  :host

    validates :description, presence: true, length: { in: 2..100 }
    validates :host, presence: true

    validate :valid_occurred_at?

    private

	def valid_occurred_at?
	  if occurred_at.present?
	    errors.add(:occurred_at, "is an invalid date.") unless occurred_at.is_a?(Time)
      else
      	errors.add(:occurred_at, "not present.")
	  end
	end
end