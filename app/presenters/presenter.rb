class Presenter
  def initialize
    @searcher = SearchResults.new
  end
  def nearest_stations
  #  response =  NRELService.new.search_stations
  #   JSON.parse(response.body)['fuel_stations'].map do |station|
  #     Station.new(station)
  #   end
    @searcher.get_stations_by_zip_code('80203')
  end
end
