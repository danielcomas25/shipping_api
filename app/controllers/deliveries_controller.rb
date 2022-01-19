class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.where(delivery_params)
    render json: @deliveries, status: :ok
  end

  def show
    find_package
    render json: @delivery, status: :ok
  end

  private

  def delivery_params
    params.permit(:package_id)
          .map { |k, v| [k, v.to_id] }
  end

  def find_delivery
    Delivery.find(params[:id].to_i)
  end
end
