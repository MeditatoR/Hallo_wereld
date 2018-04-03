class Train
  attr_accessor :speed, :wagons_qty, :number # публичные методы, т.к. нужно управлять классом и его методами из главного меню
  attr_reader   :train_type

  alias_method :current_speed, :speed



  def initialize(number)
    @number = number
    @speed = 0
    @train_type = train_type
    @wagons = []
    @wagons_qty = 0
  end

  def gain_speed(how_mutch)
    how_mutch = how_mutch
    return 'Скорость не может быть < 0' if how_mutch < 0
    @speed += how_mutch
  end

  def brake
    @speed = 0
  end


  def attach_wagon(wagon)
    if @speed == 0 && wagon.wagon_type == train_type
       @wagons_qty +=1
       @wagons << wagon
    else
      puts 'Поезд движется, ошибка!'
    end
  end


  def detach_wagon
    if @speed == 0 && @wagons_qty > 0 && !@wagons.empty?
       @wagons_qty -=1
       @wagons.delete_at(-1)
    else
      puts 'Поезд движется, ошибка!'
    end
  end

  def set_route(route)
    @current_route = route
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
