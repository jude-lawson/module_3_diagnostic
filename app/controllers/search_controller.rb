class SearchController < ApplicationController
  def index
    domain = Faraday.new(url: 'https://developer.nrel.gov/')
    response = domain.get '/api/alt-fuel-stations/v1/nearest.json', { api_key: ENV['NREL_API_KEY'], location: '80203', radius: '6', fuel_type: 'ELEC,LPG', limit: '10' }
    parsed_response = JSON.parse(response.body)['fuel_stations']
    fuel_types =  Hash.new('ELEC' => 'Electric', 'LPG' => 'Propane')

    stations = parsed_response.map do |station|
      {
        name: station['name'],
        address: station['street_address'],
        fuel_type: fuel_types[station['fuel_type_code']],
        distance: station['distance'],
        access_times: station['access_days_time']
      }
    end
    require 'pry';binding.pry

  end
end
