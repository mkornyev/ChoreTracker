class Chore < ApplicationRecord
  belongs_to :child
  belongs_to :task

  validates_date :due_on

  scope :by_task, -> { Chore.joins(:task).order('tasks.name') }
  scope :chronological, -> { Chore.order('due_on, completed') }
  scope :pending, -> { Chore.where(completed: false) }
  scope :done, -> { Chore.where(completed: true) } 
  scope :upcoming, -> { Chore.where( "due_on >= ?", Date.today) }
  scope :past, -> { Chore.where( "due_on < ?", Date.today) }

  def status
  	if self.completed
  		return "Completed"
  	else
  		return "Pending"
  	end
  end
end
