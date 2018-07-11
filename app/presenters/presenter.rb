class Presenter
  def stations
   response =  NRELService.new.search_stations
    JSON.parse(response.body)['fuel_stations'].map do |station|
      Station.new(station)
    end
  end
end
