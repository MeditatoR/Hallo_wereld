require_relative 'company'
require_relative 'instance_counter'

class Wagon
  include Company
  include InstanceCounter

  attr_reader :wagon_type

  def initialize
    register_instance
  end
end
