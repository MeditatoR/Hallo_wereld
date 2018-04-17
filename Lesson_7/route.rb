require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations, :route_name

  def initialize(start, finish)
    @stations = [start, finish]
    validate!
    @route_name = "#{start.name} ->> #{finish.name}"
    register_instance
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

  protected

  def validate!
    raise 'Необходмо ввести начало и конец маршрута!' if @stations.start == nil || @stations.finish == nil
    true
  end
end
