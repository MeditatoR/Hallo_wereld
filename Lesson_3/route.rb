class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(name)
    @stations.insert(-2, name)
  end

  def dell_station(station)
    @stations.delete(station)
  end

  def print_route
    @stations.each { |e| puts e }
  end
end
