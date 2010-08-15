class Task < ActiveRecord::Base
  validates_presence_of :name, :project
  belongs_to :project
  has_one :status

  def status!
    self.status = Status.create! :task => self unless self.status != nil
    self.status
  end

  def ready?
    self.status.ready?
  end

end
