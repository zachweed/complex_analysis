require 'rspec'
require './coordinate_systems/euclidean_plane.rb'

RSpec.describe EuclideanPlane do
  context "#place_point" do
    context "for a point out of bounds" do
      it "raises an error" do
        expect{ described_class.new(1).place_point(2,2) }.to raise_error
      end
    end
  end

  context "#combined" do
    context "with max of 1" do
      let(:drawn) { EuclideanPlane.new(1).draw }

      subject { drawn[:combined] }

      it "returns a structure that we can build a graph from" do
        expect(subject).to eq(" | \n- -\n | \n")
      end
    end
    context "with max of 2" do
      let(:drawn) { EuclideanPlane.new(2).draw }

      subject { drawn[:combined] }

      it "returns a structure that we can build a graph from" do
        expect(subject).to eq("  |  \n  |  \n-- --\n  |  \n  |  \n")
      end
    end
    context "with a max of 3" do
      let(:drawn) { EuclideanPlane.new(3).draw }

      subject { drawn[:combined] }

      it "returns a structure that we can build a graph from" do
        expect(subject).to eq("   |   \n   |   \n   |   \n--- ---\n   |   \n   |   \n   |   \n")
      end
    end
  end

  context "#draw" do
    context "quadrants" do
      context "with one" do
        subject { EuclideanPlane.new(1).draw }

        context "left quadrant" do
          it "returns structure with a left quadrant equal to the total number of hyphens" do
            expect(subject[:left]).to eq("-")
          end
        end
        context "right quadrant" do
          it "returns structure with a right quadrant equal to the total number of hyphens" do
            expect(subject[:right]).to eq("-\n")
          end
        end
        context "top iso split" do
          it "returns structure with the number of spaces, a pipe character, total number of spaces, and a line break" do
            expect(subject[:top]).to eq(" | \n")
          end
        end
        context "bottom iso split" do
          it "returns structure with the number of spaces, a pipe character, & total number of spaces" do
            expect(subject[:bottom]).to eq(" | \n")
          end
        end
      end
      context "with two" do
        subject { EuclideanPlane.new(2).draw }

        context "left quadrant" do
          it "returns structure with a left quadrant equal to the total number of hyphens" do
            expect(subject[:left]).to eq("--")
          end
        end

        context "right quadrant" do
          it "returns structure with a right quadrant equal to the total number of hyphens" do
            expect(subject[:right]).to eq("--\n")
          end
        end

        context "top iso split" do
          it "returns structure with the number of spaces, a pipe character, total number of spaces, and a line break" do
            expect(subject[:top]).to eq("  |  \n  |  \n")
          end
        end

        context "bottom iso split" do
          it "returns structure with the number of spaces, a pipe characters, total number of spaces, and a line break" do
            expect(subject[:bottom]).to eq("  |  \n  |  \n")
          end
        end
      end

      context "with three" do
        subject { EuclideanPlane.new(3).draw }

        context "left quadrant" do
          it "returns structure with a left quadrant equal to the total number of hyphens" do
            expect(subject[:left]).to eq("---")
          end
        end

        context "right quadrant" do
          it "returns structure with a right quadrant equal to the total number of hyphens" do
            expect(subject[:right]).to eq("---\n")
          end
        end

        context "top iso split" do
          it "returns structure with the number of spaces, a pipe character, total number of spaces, and a line break" do
            expect(subject[:top]).to eq("   |   \n   |   \n   |   \n")
          end
        end

        context "bottom iso split" do
          it "returns struture with the number of spaces, a pipe character, total number of spaces, and a line break" do
            expect(subject[:bottom]).to eq("   |   \n   |   \n   |   \n")
          end
        end
      end
    end
  end
end