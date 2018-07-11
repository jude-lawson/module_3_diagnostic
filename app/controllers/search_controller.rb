class SearchController < ApplicationController
  def index
    domain = Faraday.new(url: 'https://developer.nrel.gov/')
    response = domain.get '/api/alt-fuel-stations/v1/nearest.json', { api_key: ENV['NREL_API_KEY'], location: '80203', radius: '6', fuel_type: 'ELEC,LPG', limit: '10' }
    
  end
end
