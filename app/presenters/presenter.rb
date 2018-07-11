class Presenter
  def initialize(options)
    @searcher = options[:searcher]
  end

  def nearest_stations
    @searcher.get_stations_by_zip_code
  end
end
