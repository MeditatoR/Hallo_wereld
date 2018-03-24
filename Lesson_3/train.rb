class Train
  attr_accessor :speed, :wagons_qty, :number
  attr_reader   :train_type

  alias_method :current_speed, :speed

  def initialize(number, speed = 0, wagons_qty=0, train_type)
    @number = number
    @speed = speed
    @train_type = train_type
    @wagons_qty = wagons_qty
  end

  def gain_speed(how_mutch)
    how_mutch = how_mutch
    return 'Скорость не может быть < 0' if how_mutch < 0
    @speed += how_mutch
  end

  def brake
    @speed = 0
  end

  def attach_wagon
    if @speed == 0
       @wagons_qty +=1
    else
      puts 'Поезд движется, ошибка!'
    end
  end

  def detach_wagon
    if @speed == 0 && @wagons_qty > 0
       @wagons_qty -=1
    else
      puts 'Поезд движется, ошибка!'
    end
  end

  def set_route(route)
    @current_route == route
    @point = 0
    current_station.recieve_train self
  end

  def current_station
      @current_route.stations[@point]
  end

  def move_fwd
    return 'Конечная точка маршрута, движение вперёд не возможно' if @point >= @current_route.stations.size
    current_station.send_train self
    @point +=1
    current_station.recieve_train self
  end

  def move_back
    return 'Начальная точка маошрута, движение возможно только вперёд' if @point == 0
    current_station.send_train self
    @point -=1
    current_station.recieve_train self
  end

  def where_am_i
    puts "Маршрут #{@current_route}"
    puts "Предыдущая станция #{ @current_route.stations[@point - 1] }"
    puts "Текущая станция #{ @current_route.stations[@point] }"
    puts "Следующая станция #{ @current_route.stations[@point + 1] }"
  end
end
