class Train
  attr_accessor :current_route
  attr_reader   :train_type

  def initialize(number, speed = 0, train_type, wagons_qty)
    @number = number
    @speed = speed
    @train_type = train_type
    @wagons_qty = wagons_qty
    @current_route = []
  end

  def gain_speed(how_mutch)
    how_mutch = how_mutch
    @speed += how_mutch
  end

  def current_speed
    return @speed
  end

  def brake
    @speed = 0
  end

  def wagons_qty
    return @wagons_qty
  end

  def attach_wagon
    if @speed == 0
       @wagons_qty +=1
    else
      puts 'Поезд движется, ошибка!'
    end
  end

  def detach_wagon
    if @speed == 0
       @wagons_qty -=1
    else
      puts 'Поезд движется, ошибка!'
    end
  end

  def set_route(route)
    @current_route = route
    @point = 0
  end

  def current_station
      @current_route.waybill[@point]
  end

  def move_fwd
    @point +=1
    @current_route.waybill[@point]
  end

  def move_back
    @point -=1
    @current_route.waybill[@point]
  end

  def where_am_i
    puts "Маршрут #{@current_route}"
    puts "Предыдущая станция #{ @current_route.waybill[@point - 1] }"
    puts "Текущая станция #{ @current_route.waybill[@point] }"
    puts "Следующая станция #{ @current_route.waybill[@point + 1] }"
  end
end
