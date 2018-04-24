require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'valid'

class Main
  attr_accessor :trains, :routes, :stations

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @wagons = []
  end

  def menu
    input = 1
    while input != 0
      puts 'Выберете действие
         1.- Создавать станции
         2.- Создавать поезда
         3.- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
         4.- Назначать маршрут поезду
         5.- Добавлять вагоны к поезду
         6.- Отцеплять вагоны от поезда
         7.- Перемещать поезд по маршруту вперед и назад
         8.- Просматривать список станций и список поездов на станции
         9. - Вагоны.

         0 - ВЫХОД'

      input = gets.chomp.to_i

      case input
      when 1 then create_station
      when 2 then create_train
      when 3 then route_menu
      when 4 then add_route_to_train
      when 5 then add_wagon
      when 6 then remove_wagon
      when 7 then movement_menu
      when 8 then station_info
      when 9 then wagon_menu
      when 0 then puts 'Конец'
      else
        puts 'Данная операция не предусмотрена'
      end
    end
  end

  private

  def create_train
    puts 'Введите номер поезда:'
    number = gets.chomp
    puts 'Выберите тип поезда:
    1. - Пассажирский
    2. - Грузовой'
    type = gets.chomp.to_i
    case type
    when 1 then train = PassengerTrain.new(number)
    when 2 then train = CargoTrain.new(number)
    end
    @trains << train
    puts "Поезд #{train.number} создан" unless train.valid?
  end

  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    stations << Station.new(name)
  end

  def create_wagon
    puts 'Выберите тип вагона
    1. - Пассажирский
    2. - Грузовой'
    type = gets.chomp.to_i
    case type
    when 1 then wagon = PassengerWagon.new
    when 2 then wagon = CargoWagon.new
    end
    @wagons << wagon
    puts "Вагон #{wagon.wagon_type} создан"
  end

  def train_select
    puts 'Доступные поезда:'
    trains.each.with_index(1) { |k, v| puts "Номер #{k.number} => Поезд #{v}" }
    puts 'Выберите номер поезда'
    index = gets.chomp.to_i
    index > @trains.count ? (puts 'Такого поезда не существует') : @trains[index - 1]
  end

  def station_select
    puts 'Доступные станции:'
    @stations.each.with_index(1) { |k, v| puts "#{k.name} => Станция #{v}" }
    puts 'Укажите станцию '
    index = gets.chomp.to_i
    index > @stations.count ? (puts 'Такой станции не существует') : @trains[index - 1]
  end

  def station_info
    puts 'Доступные станции'
    @stations.each.with_index(1) { |k, v| puts " #{k.name} => Станция #{v}" }
    puts 'Введите номер станции'
    selected_station = gets.chomp.to_i
    puts "Доступные поезда на станции #{@stations[selected_station]}"
    b = @stations[selected_station - 1]
    b.print_train_list
  end

  def add_wagon
    train = train_select
    return puts 'Ошибка, введены несуществующие данные' if train.nil?
    wagon = PassengerWagon.new if train.class == PassengerTrain
    wagon = CargoWagon.new if train.class == CargoTrain
    train.attach_wagon(wagon)
  end

  def remove_wagon
    train = train_select
    return puts 'Ошибка, введены несуществующие данные' if train.nil?
    train.detach_wagon
  end

  def add_route_station
    route = route_select
    station = station_select
    route.add_station(station)
    puts " #{route.print_route}"
  end

  def wagon_menu
    puts 'Управление вагонами:
      1. - Создать вагон
      2. - Занять место/объём в вагоне
      3. - Выводить список вагонов / количество мест у поезда
      0 - Выход'

    input = gets.chomp.to_i
    case input
    when 1 then create_wagon
    when 2 then take_seat
    when 3 then wagon_list
    when 0 then menu
    else puts 'Действие невозможно'
    end
  end

  def wagon_select
    puts 'Доступные вагоны:'
    @wagons.each.with_index(1) { |k, v| puts "#{k.wagon_type} вагон => № #{v}" }
    puts 'Выберите вагон:'
    selected_wagon = gets.chomp.to_i
    selected_wagon < 1 ? (puts 'Выбран несуществующий вагон') : @wagons[selected_wagon - 1]
  end

  def wagon_list
    train = train_select
    wagon_number = 0
    train.wagons_each do |wagon|
      if wagon.wagon_type == 'пассажирский'
        puts "Вагон #{wagon_number += 1}, Свободно мест: #{wagon.seats}, занято: #{wagon.seats_b}"
      else
        puts "Вагон #{wagon_number += 1}, Свободно объем: #{wagon.volume}, занято: #{wagon.volume_b}"
      end
    end
  end

  def take_seat
    wagon = wagon_select
    if wagon.wagon_type == 'пассажирский'
      wagon.take_seat
    else
      wagon.take_volume
    end
  end

  def route_menu
    puts 'Управление маршрутами:
    1. - Создать маршрут
    2. - Добавить станцию в маршрут
    3. - Удалить станцию из маршрута

    0 - Выход'

    input = gets.chomp.to_i
    case input
    when 1 then create_route
    when 2 then add_route_station
    when 3 then remove_route_station
    when 0 then menu
    else puts 'Действие невозможно'
    end
  end

  def remove_route_station
    route = route_select
    station = station_select
    route.dell_station(station)
  end

  def create_route
    puts 'Ведите начальную и конечную станции маршрута маршрута'
    puts 'Начальная станция:'
    start = station_select
    puts 'Конечная станция:'
    finish = station_select
    return puts 'Введена несуществующая станция' if start.nil? || finish.nil?
    @routes << Route.new(start, finish)
  end

  def route_select
    puts 'Доступные маршруты:'
    @routes.each.with_index(1) { |k, v| puts "#{k.route_name} => Маршрут #{v}" }
    puts 'Выберите маршрут:'
    selected_route = gets.chomp.to_i
    @routes[selected_route - 1]
  end

  def movement_menu
    train = train_select
    return puts 'Ошибка, введены несуществующие данные' if train.nil?
    puts 'Выберете направление движения поезда
    1. - Вперёд
    2. - Назад

    0 - Выход'

    input = gets.chomp.to_i
    case input
    when 1 then train.move_fwd
    when 2 then train.move_back
    when 0 then menu
    end
  end

  def add_route_to_train
    route = route_select
    train = train_select
    return puts 'Ошибка, введены несуществующие данные' if train.nil? || route.nil?
    train.get_route(route)
  end

  puts "\e[31m MAIN RB!\e[0m"
  a = Main.new
  a.menu
end
