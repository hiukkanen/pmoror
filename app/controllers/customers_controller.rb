class CustomersController < ApplicationController
  def name
    old_customer = Customer.find_by_name params[:value]
    customer = Customer.find params[:id]
    if old_customer && old_customer.id != customer.id
      old_customer.projects << customer.projects
      old_customer.save!
      customer.destroy
    else
      customer.name = params[:value]
      customer.save!
    end
    render text: params[:value]
  end
end
