class CargoWagon < Wagon
attr_reader :wagon_type
  attr_accessor :volume, :volume_b

  def initialize
    super
    puts 'Введите общий оъём вагона'
    @wagon_type = 'грузовой'
    @volume = gets.chomp.to_i
    @volume_f = @volume
    @volume_b = 0
  end

  def take_volume
    unless @volume_f >= 1
      puts 'Нет свободного объёма'
    else
      @volue_f -= 1
      @volume_f +=1
      puts "Свободный объём #{@volume_f}"
    end
  end

  def volume_occupied
    @volume_b
  end

  def volume_left
    @volume
  end

end
