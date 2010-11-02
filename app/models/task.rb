class Task < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :project
  has_one :status
  has_many :tasks
  belongs_to :task
  belongs_to :project_group
  default_scope :order => 'id'

  before_save :validate
  
  def validate
    if project != nil
      raise "parent task is missing" if task == nil
    end
    if project_group != nil
      raise "should not have parent" if task != nil
    end
  end

  def status!
    self.status = Status.create! :task => self unless self.status != nil
    self.status
  end

  def ready?
    self.status!.ready?
  end

end
