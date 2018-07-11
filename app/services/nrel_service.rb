class NRELService
  def initialize
    @domain = Faraday.new(url: 'https://developer.nrel.gov/')
  end

  def search_stations
    response = @domain.get '/api/alt-fuel-stations/v1/nearest.json', { api_key: ENV['NREL_API_KEY'],
                                                                       location: '80203', 
                                                                       radius: '6', 
                                                                       fuel_type: 'ELEC,LPG', 
                                                                       limit: '10' }
    JSON.parse(response.body)['fuel_stations'].map do |station|
      Station.new(station)
    end
  end
end
