class CustomersController < ApplicationController
  before_action :require_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
 
  def index
    @customers = current_user.customers.order(:name)
  end
 
  def show;
    @customer = Customer.find(params[:id])

  end
 
  def new
    @customer = current_user.customers.new
    
  end
 
  def edit; 
    @customer = Customer.find(params[:id])

  end
 
  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      redirect_to @customer, notice: "Cliente creado."
    else
      render :new, status: :unprocessable_entity
    end
  end
 
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "Cliente actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "Cliente eliminado."
  end
 
  private
  def set_customer
    @customer = current_user.customers.find(params[:id])
  end
  def customer_params
    params.require(:customer).permit(:name, :guid, :external_id)
  end
end
