require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'



class Main
  attr_accessor :trains, :routes, :stations

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end


  def create_station
    puts 'Введите название станции:'
    name = gets.chomp
    stations << Station.new(name)
  end


  def create_train
    puts 'Введите номер поезда:'
    number = gets.chomp
    puts 'Выберите тип поезда:
    1. - Пассажирский
    2. - Грузовой'
    type = gets.chomp.to_i
    case type
      when 1 then trains << PassengerTrain.new(number)
      when 2 then trains << CargoTrain.new(number)
    end
  end


  def train_select
    puts 'Доступные поезда:'
    trains.each_with_index {|k, v| puts "Номер #{k.number} => Поезд #{v += 1}" }
    puts 'Выберите номер поезда'
    index = gets.chomp.to_i
    @trains[index -= 1]
  end


  def station_select
    puts 'Доступные станции:'
    @stations.each_with_index {|k, v| puts "#{k.name} => Станция #{v += 1}" }
    puts 'Укажите станцию '
    index = gets.chomp.to_i
    @stations[index -= 1]
  end


  def station_info
    puts 'Доступные станции'
    @stations.each_with_index {|k, v| puts " #{k.name} => Станция #{v += 1}" }
    puts 'Введите номер станции'
    selected_station = gets.chomp.to_i
    puts "Доступные поезда на станции #{@stations[selected_station]}"
    b = @stations[selected_station -= 1]
    b.print_train_list
  end


  def add_wagon
    train = train_select
    wagon = PassengerWagon.new if train.class == PassengerTrain
    wagon = CargoWagon.new if train.class == CargoTrain
    train.attach_wagon(wagon)
  end


  def remove_wagon
    train = train_select
    train.detach_wagon
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


  def add_route_station
    route = route_select
    station = station_select
    route.add_station(station)
    puts " #{route.print_route}"
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
    @routes << Route.new(start, finish)
  end


  def route_select
    puts 'Доступные маршруты:'
    @routes.each_with_index {|k, v| puts "#{k.route_name} => Маршрут #{v += 1}" }
    puts 'Выберите маршрут:'
    selected_route = gets.chomp.to_i
    @routes[selected_route -= 1]
  end


  def movement_menu
    train = train_select
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
    train.set_route(route)
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
        when 0 then puts 'Конец'
        else
          puts 'Данная операция не предусмотрена'
        end
    end
  end

  puts "\e[31m MAIN RB!\e[0m"
end
