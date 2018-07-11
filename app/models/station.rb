class Station
  attr_reader :id, :name, :address, :fuel_type, :distance, :access_times

  def initialize(station_result)
    fuel_types = { 'ELEC' => 'Electric', 'LPG' => 'Propane' }

    @id = station_result['id']
    @name = station_result['station_name']
    @address = station_result['street_address']
    @fuel_type = fuel_types[station_result['fuel_type_code']]
    @distance = station_result['distance']
    @access_times = station_result['access_days_time']
  end
end
