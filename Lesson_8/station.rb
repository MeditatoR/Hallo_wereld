require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_accessor :name

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def trains_each
    @trains.each { |train| yield(train) }
  end

  def self.all
    @@stations.each { |s| puts s.name.to_s }
  end

  def recieve_train(train)
    @trains.push(train)
  end

  def print_train_list
    @trains.each { |train| puts "Поезд #{train.number}, Тип #{train.train_type}" }
  end

  def print_train_type(train_type)
    @trains.select { |train| train.train_type == train_type }.size
  end

  def send_train(train)
    @trains.delete(train)
  end

  private

  def validate!
    raise 'Введите название станции' if @name.nil?
    true
  end
end
