require_relative 'bike'

class DockingStation

attr_accessor :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_array = []
    @capacity = capacity

  end



  #attr_reader :bike #Use method #bike to check bike docked at station
  #
  def bike
    @bike_array #shows all bikes at the station
  end

  def release_bike
    fail 'No bikes available' unless !empty?
    fail 'Cannot release. Bike broken' if @bike_array.last.broken?
    @bike_array.pop
  end

   def dock(bike)
     # We need to return the bike we dock
     fail 'Docking station full' if full?
     @bike_array.push(bike)
  end

private

  def full?
    @bike_array.count >= capacity
  end

  def empty?
    @bike_array.empty?
  end

end


#manchester = DockingStation.new
#suthportred = Bike.new
