class OrdersController < ApplicationController
  before_action :authenticate_client!

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = current_client.orders.new(plan_id: params[:plan_id])
    @order.save
    redirect_to @order, notice: t('.notice')
  end
end
