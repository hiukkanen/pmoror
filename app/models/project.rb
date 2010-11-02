class Project < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :name, :project_group
  belongs_to :customer
  belongs_to :project_group
  before_save :set_default_dates

  def set_default_dates
    self.start_date = DateTime.now unless self.start_date
    self.end_date = DateTime.now unless self.end_date
  end

  def task_names
    names = []
    project_group.tasks.each do |task|
      names.push task.name
    end
    return names
  end

  def tasks_in_order!
    map = {}
    self.tasks!.each do |t|
      map.merge! t.task.name => t
    end
    list = []
    task_names.each do |t|
      list << map[t.to_s] if map[t.to_s] != nil
    end
    list
  end

  def tasks!
    return tasks if tasks.size > 0
    tasks = []
    task_names.each do |t|
      project_group_task = project_group.tasks.find_by_name t
      tasks << Task.new(:name => t.to_s, :task => project_group_task)
    end
    self.tasks = tasks
    self.save!
    self.tasks
  end

  def all_ready?
    self.tasks!.each do |t|
      return false unless t.ready?
    end
    true
  end

  def customer!
    return self.customer if customer
    self.customer = Customer.new unless self.customer
    self.customer.save!
    self.save!
    return self.customer
  end

  def start_end_date
    return "#{self.start_date}-#{self.end_date}"
  end

end
