class PassengerWagon < Wagon
  attr_reader :wagon_type

  def initialize
    @wagon_type = 'пассажирский'
  end
end
