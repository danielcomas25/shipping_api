class PackagesController < ApplicationController
  # GET /packages
  def index
    @packages = Package.where(package_params)
    render json: @packages, status: :ok
  end

  # POST /packages
  # TODO
  def create
    @package = Package.create!(package_params)
    @delivery = ::Services::DeliveryGenerator.new(@package).call
    render json: { package: @package, delivery: @delivery }, status: :ok
  end

  # GET /packages/:id
  def show
    find_package
    render json: @package, status: :ok
  end

  # PUT /packages/:id
  def update
    find_package
    @package.update(package_params)
    head :no_content
  end

  # DELETE /packages/:id
  def destroy
    find_carrier
    @package.destroy
    head :no_content
  end

  private

  def package_params
    params.permit(:carrier_id, :shipping_date,
                  :origin_country, :destination_country)
          .map do |param, value|
            new_value = case param.to_sym
                        when :shipping_date
                          Date.parse(value)
                        when :carrier_id
                          value.to_i
                        else
                          value.upcase
                        end
            [param, new_value]
          end.to_h
  end

  def find_package
    @package = Package.find(params[:id].to_i)
  end
end
