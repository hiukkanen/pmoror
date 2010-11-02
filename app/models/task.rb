class Task < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :project
  has_one :status
  has_one :task
  default_scope :order => 'id'

  def status!
    self.status = Status.create! :task => self unless self.status != nil
    self.status
  end

  def ready?
    self.status!.ready?
  end

end
