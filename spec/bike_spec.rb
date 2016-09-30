require 'bike'

describe Bike do
  it { is_expected.to respond_to :working?}
  
  it 'reports a bike as broken' do
      bike = Bike.new
      bike.report_broken
      expect(bike).to be_broken
  end
 end