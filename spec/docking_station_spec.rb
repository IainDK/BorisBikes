require 'docking_station'

describe DockingStation do


  it 'has default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end


    describe 'initialization' do
  it 'has a variable capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock Bike.new }
    docking_station
    expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'
  end
end



  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
expect(subject.bike.pop).to eq bike
  end

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock(Bike.new)
    bike = subject.release_bike #FIX HERE
    expect(bike).to be_working
  end

  it { is_expected.to respond_to (:bike) }

  describe '#release_bike' do
    it 'returns error when no bike available' do
      #subject.release_bike
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'returns error when docking station is full' do
    #subject.dock(Bike.new)
      bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times do
     subject.dock(bike)
      #expect {subject.dock(bike)}.to raise_error 'Docking station at capacity'
    end
  end
 end
 end
