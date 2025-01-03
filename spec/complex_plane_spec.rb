require 'rspec'
require './complex_plane.rb'

RSpec.describe ComplexPlane do
  context '#generate_y_points' do
    let(:points){ ComplexPlane.new.send(:generate_y_points) }
    it 'builds a list of y points that can exist on a complex plane' do
      expect(points.class).to eq(Array)
    end
  end
end