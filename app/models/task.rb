class Task < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :project, optional: true
  has_one :status
  has_many :tasks
  belongs_to :task, optional: true
  belongs_to :project_group, inverse_of: :tasks, optional: true
  default_scope -> { order(:id) }

  def status!
    self.status = Status.create! task: self if status.nil?
    status
  end

  def ready?
    status!.ready?
  end
end
