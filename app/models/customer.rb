class Customer < ActiveRecord::Base
  has_many :projects

  before_save :replace_with_existing, if: ->(customer) { customer.projects.empty? }

  def replace_with_existing
    customer = Customer.find_by_name name
    return false if customer && name
  end
end
