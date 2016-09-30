require 'docking_station'
require 'bike'

describe DockingStation do




  it { is_expected.to respond_to (:bike) }

  describe 'initialization' do
    
      #let(:Bike) { double :Bike }
      
    it 'has default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new } # * double *
      expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'   # * double *
    end
  end


  describe '#dock()' do
    it 'returns docked bikes' do
      bike = Bike.new                                       # * double * 
      subject.dock(bike)
      expect(subject.bike.pop).to eq bike
    end

    it 'returns error when docking station is full' do
      bike = Bike.new                                               # * double *
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
    end

    it 'accepts docking bikes, broken or not' do
      bike = Bike.new                                   # * double *
      broken_bike = Bike.new                            # * double *
      broken_bike.report_broken                         # ~~ double ~~ 
      subject.dock(bike)
      subject.dock(broken_bike)
      expect(subject.bike.pop).to eq broken_bike
      expect(subject.bike.pop).to eq bike
      #I'd like docking stations to accept returning bikes (broken or not).
    end
  end

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      subject.dock(Bike.new)                                              # * double *
      bike = subject.release_bike #FIX HERE
      expect(bike).to be_working                            # ~~ double ~~ 
    end

    it 'returns error when no bike available' do
      #subject.release_bike
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'returns' do
      # I'd like docking stations not to release broken bikes.
      broken_bike = Bike.new                                                          # * double *
      broken_bike.report_broken                                                       # ~~ double ~~
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error 'Cannot release. Bike broken'
    end
  end
end
