class SearchController < ApplicationController
  def index
    # domain = Faraday.new(url: 'https://developer.nrel.gov/')
    # response = NRELService.new.search_stations
    @stations = NRELService.new.search_stations

    # @stations = parsed_response.map do |station|
    #   Station.new(station)
    # end
  end
end
