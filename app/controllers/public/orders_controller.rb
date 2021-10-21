class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.all
    @customer = current_customer
  end

  def confirm
    if params[:order][:address_number] == nil || params[:order][:payment_method] == nil
      redirect_to new_order_path
    end
    #binding.pry
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if params[:order][:address_number] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

  end

  def complete
  end

  def create

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    #binding.pry
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item| #注文履歴を表示させる為に必要
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item_id
      @order_details.price = cart_item.item.price
      @order_details.save
    end

    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    #binding.pry
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
end
