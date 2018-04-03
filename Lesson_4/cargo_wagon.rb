class CargoWagon < Wagon
  attr_reader :wagon_type

  def initialize
    @wagon_type = 'грузовой'
  end
end
