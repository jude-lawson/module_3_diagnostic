class NRELService
  def initialize
    @domain = Faraday.new(url: 'https://developer.nrel.gov/')
  end

  def nearest_stations(zip_code)
    @domain.get '/api/alt-fuel-stations/v1/nearest.json', { api_key: ENV['NREL_API_KEY'],
                                                            location: zip_code, 
                                                            radius: '6', 
                                                            fuel_type: 'ELEC,LPG', 
                                                            limit: '10' }
  end
end
