class SearchResults
  def initialize(options = {})
    @nrel_service = NRELService.new
    @zip_code = options[:zip_code]
  end

  def get_stations_by_zip_code
    JSON.parse(@nrel_service.nearest_stations(@zip_code).body)['fuel_stations'].map do |station|
      Station.new(station)
    end
  end

end
