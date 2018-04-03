class PassengerTrain < Train
  attr_reader :train_type

  def initialize(number)
    @train_type = 'пассажирский'
    super
  end
end
