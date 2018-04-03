class Station
  attr_accessor :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def recieve_train(train)
    @trains.push(train)
  end

  def print_train_list
    @trains.each { |train| puts "Поезд #{train.number}, Тип #{train.train_type}" }
  end

  def print_train_type(train_type)
    puts "Поездов типа #{train_type} на станции - #{@trains.select { |train| train.train_type == train_type}.size}"
  end

  def send_train(train)
    @trains.delete(train)
  end
end
