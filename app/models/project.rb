class Project < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :name
  belongs_to :customer

  def self.task_names
    [:Skema, :Leiska, :Meka, :Softa, :Laskut]
  end

  def tasks_in_order!
    map = {}
    self.tasks!.each do |t|
      map.merge! t.name => t
    end
    list = []
    Project.task_names.each do |t|
      list << map[t.to_s] if map[t.to_s] != nil
    end
    list
  end

  def tasks!
    return tasks if tasks.size > 0
    tasks = []
    Project.task_names.each do |t|
      tasks << Task.new(:name => t.to_s)
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
    self.customer = Customer.new 
    self.save!
    return self.customer
  end

end
