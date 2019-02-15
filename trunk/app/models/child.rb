class Child < ApplicationRecord
	#byebug
	has_many :chores
	has_many :tasks, through: :chores


	validates_presence_of :first_name
	validates_presence_of :last_name

	def name
  		return self.first_name.to_s + " " + self.last_name.to_s
	end

	scope :alphabetical, -> { order('last_name', 'first_name') }
	scope :active, -> { where(active: true) }

end
