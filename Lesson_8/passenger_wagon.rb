class PassengerWagon < Wagon
  attr_reader :wagon_type
  attr_accessor :seats, :seats_b

  def initialize
    super
    puts 'Введите количество мест в вагоне'
    @seats = gets.chomp.to_i
    @wagon_type = 'пассажирский'
    @seats_f = @seats
    @seats_b = 0
  end

  def take_seat
    if @seats_f >= 1
      puts 'Свободных мест нет'
    else
      @seats_f -= 1
      @seats_b += 1
      puts "Свободных мест #{@seats_f}"
    end
  end

  def seats_took
    @seats_b
  end

  def seats_free
    @seats
  end
end
