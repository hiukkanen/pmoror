class Project < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :name, :project_group
  belongs_to :customer
  belongs_to :project_group
  before_save :set_default_dates

  def set_default_dates
    self.start_date = DateTime.now unless start_date
    self.end_date = DateTime.now unless end_date
  end

  def task_names
    names = []
    project_group.tasks.each do |task|
      names.push task.name
    end
    names
  end

  def tasks_in_order!
    map = {}
    tasks!.each do |t|
      map.merge! t.task.name => t
    end
    list = []
    task_names.each do |t|
      list << map[t.to_s] unless map[t.to_s].nil?
    end
    list
  end

  def tasks!
    return tasks unless tasks.empty?
    tasks = []
    task_names.each do |t|
      project_group_task = project_group.tasks.find_by_name t
      tasks << Task.new(name: t.to_s, task: project_group_task)
    end
    self.tasks = tasks
    save!
    self.tasks
  end

  def all_ready?
    tasks!.each do |t|
      return false unless t.ready?
    end
    true
  end

  def customer!
    return customer if customer
    self.customer = Customer.new unless customer
    customer.save!
    save!
    customer
  end

  def start_end_date
    "#{start_date}-#{end_date}"
  end
end
