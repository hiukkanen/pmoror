class Status < ActiveRecord::Base
  belongs_to :task
  validates_presence_of :task, :code

  def number_of_phases
    3
  end

  def next
    self.code = self.code + 1 
    self.code = 0 if self.code > number_of_phases - 1
  end

  def css_classes
    ["nop", "do", "done"]
  end

  def css_class
    css_classes[code]
  end

  def ready?
    code + 1 == number_of_phases
  end

end
