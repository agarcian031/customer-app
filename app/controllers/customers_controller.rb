class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  def index
    #active Record 
    #@customers = current_user.customers 

    #SQL 
    @customers = Customer.all_customers(current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end 

  def edit
  end

  def update 
  end 

  def destroy 
  end 

  private
  def set_customer
    #Active Record 
    # @customer = current_user.customers.find(params[:id])

    #SQL 
    @customer = Customer.single_customer(current_user.id, params[:id])
  end 
end
