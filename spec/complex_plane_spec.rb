require 'rspec'
require './complex_plane.rb'

RSpec.describe ComplexPlane do
  context '#generate_y_points' do
    let(:points){ ComplexPlane.new.send(:generate_y_points) }
    it 'builds a list of y points that can exist on a complex plane' do
      expect(points.class).to eq(Array)
    end
  end

  context "#build_quadrant" do
    context "with a max greater than 0" do
      it "creates a graph with an absolute maximum of 1 on X and Y" do
        expect(ComplexPlane.new.build_quadrant(1)).to eq(" | \n -")
      end
    end
  end

  context "#draw" do
    context "left quadrant" do
      it "returns structure with a left quadrant" do
        ab = ComplexPlane.new
        structures = ab.draw(1)
        expect(structures[:left]).to_not be_nil
      end
    end
  end
end