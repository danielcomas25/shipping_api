# frozen_string_literal: true

# Country Distances controller
class CountryDistancesController < ApplicationController
  # GET /country_distances
  def index
    @country_distances = CountryDistance.where(country_distance_params)
    render json: @country_distances, status: :ok
  end

  # POST /country_distances
  # TODO
  def create
    @country_distance = CountryDistance.create!(country_distance_params)
    render json: @country_distance, status: :ok
  end

  # GET /country_distances/:id
  def show
    find_country_distance
    render json: @country_distance, status: :ok
  end

  # PUT /country_distances/:id
  def update
    find_country_distance
    @country_distance.update(country_distance_params)
    head :no_content
  end

  # DELETE /country_distances/:id
  def destroy
    find_country_distance
    @country_distance.destroy
    head :no_content
  end

  private

  def country_distance_params
    params.permit(:distance, :country)
  end

  def find_country_distance
    @country_distance = CountryDistance.find(params[:id].to_i)
  end
end
