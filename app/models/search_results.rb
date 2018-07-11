class SearchResults
  def initialize
    @nrel_service = NRELService.new
  end

  def get_stations_by_zip_code(zip_code)
    JSON.parse(@nrel_service.nearest_stations.body)['fuel_stations'].map do |station|
      Station.new(station)
    end
  end

end
