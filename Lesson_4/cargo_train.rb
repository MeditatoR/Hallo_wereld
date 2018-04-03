class CargoTrain < Train
 attr_reader :train_type

  def initialize(train_name)
    super
    @train_type = 'грузовой'
  end
end
