class CustomersController < ApplicationController

  def name
    customer = Customer.find params[:id]
    customer.name = params[:value]
    customer.save!
    render :text => customer.name
  end

end
