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

  def colors
    ["#FFF", "#CC5D4C", "#96B49C"]
  end

  def color
    colors[code]
  end

  def ready?
    code + 1 == number_of_phases
  end

end
