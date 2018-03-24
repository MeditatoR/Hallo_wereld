class Route
  attr_reader :waybill

  def initialize(start, finish)
    @waybill = [start, finish]
  end

  def add_station(name)
    @waybill.insert(-2, name)
  end

  def dell_station(station)
    @waybill.delete(station)
  end

  def print_route
    @waybill.each { |e| puts e }
  end
end
