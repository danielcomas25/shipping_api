module Services
  # Delivery service
  class DeliveryGenerator
    def initialize(package)
      @package = package
      @carrier = package.carrier
    end

    def call
      Delivery.create!(
        package_id: @package.id,
        expected_delivery: expected_delivery,
        oversea_delay: oversea_delay
      )
    end

    private

    def expected_delivery
      @package.shipping_date + (@carrier.delivery_promise + weekend_delay + oversea_delay + 1).days
    end

    def weekend_delay
      first_delivery_date = (@package.shipping_date + (@carrier.delivery_promise + 1).days)
      supplementary_days = 0
      (@package.shipping_date..first_delivery_date).to_a.each do |date|
        if !@carrier.saturday_deliveries && date.saturday?
          supplementary_days += 1
        elsif date.sunday?
          supplementary_days += 1
        end
      end
      supplementary_days
    end

    def oversea_delay
      return 0 if @package.origin_country == @package.destination_country
      threshold = @carrier.oversea_delay_threshold
      distance = CountryDistance.find_by(country: @package.origin_country)&.distance&.dig(@package.destination_country.to_sym)
      raise 'Country distance not found' if distance.nil?
      distance / threshold
    end
  end
end