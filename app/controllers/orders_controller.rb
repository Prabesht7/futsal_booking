class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:create]

  # POST /orders
  def create
    @order = current_user.orders.build

    @cart.line_items.each do |line_item|
      @order.order_items.build(shopping: line_item.shopping, quantity: line_item.quantity)
    end

    if @order.save
      ShoppingMailer.order_confirmation(@order).deliver_now

      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /orders/1
  def show
    @order = Order.find(params[:id])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
