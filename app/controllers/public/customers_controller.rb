class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    #binding.pry
    @customer.update(customer_params) #updateできない
    redirect_to customers_path
  end

  def confirm
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_member: false)
    reset_session
    redirect_to root_path

  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
