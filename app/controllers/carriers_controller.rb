# frozen_string_literal: true

# Carrier controller
class CarriersController < ApplicationController
  # GET /carriers
  def index
    @carriers = Carrier.where(carrier_params)
    render json: @carriers, status: :ok
  end

  # POST /carriers
  # TODO
  def create
    @carrier = Carrier.create!(carrier_params)
    render json: @carrier, status: :ok
  end

  # GET /carriers/:id
  def show
    find_carrier
    render json: @carrier, status: :ok
  end

  # PUT /carriers/:id
  def update
    find_carrier
    @carrier.update(carrier_params)
    head :no_content
  end

  # DELETE /carriers/:id
  def destroy
    find_carrier
    @carrier.destroy
    head :no_content
  end

  private

  def carrier_params
    params.permit(:code, :saturday_deliveries,
                  :delivery_promise, :oversea_delay_threshold)
          .map do |param, value|
            new_value = case param.to_sym
                        when :saturday_deliveries
                          value == 'true'
                        when :delivery_promise
                          value.to_i
                        when :oversea_delay_threshold
                          value.to_i
                        else
                          value
                        end
            [param, new_value]
          end.to_h
  end

  def find_carrier
    @carrier = Carrier.find(params[:id].to_i)
  end
end
