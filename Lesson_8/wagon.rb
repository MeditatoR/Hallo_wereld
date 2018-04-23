require_relative 'company'
require_relative 'instance_counter'

class Wagon
  include Company
  include InstanceCounter

  attr_reader :wagon_type

  WAGON_TYPE_FORMAT = /^\Aпассажирский\z|\Aгрузовой\z$/i

  def initialize
    #    validate!
    register_instance
  end

  protected

  def validate!
    raise ArgumentError if wagon_type !~ WAGON_TYPE_FORMAT
  rescue StandardError
    puts 'Неверный тип вагона!'
    true
  end
end
