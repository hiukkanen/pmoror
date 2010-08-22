class Customer < ActiveRecord::Base
  has_many :projects

  before_save :replace_with_existing, :if => lambda {|customer| customer.projects.size == 0}

  def replace_with_existing
    customer = Customer.find_by_name self.name
    if customer
      return false
    end
  end

end
