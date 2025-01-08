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
    context "overall" do
      let(:ab) { ComplexPlane.new }
      context "with max of 1" do
        let(:drawn) { ab.draw(1) }

        subject { drawn[:top] + drawn[:left] + drawn[:center] + drawn[:right] + drawn[:bottom] }

        it "returns a structure that we can build a graph from" do
          expect(subject).to eq(" | \n- -\n | \n")
        end
      end
      context "with max of 2" do
        let(:drawn) { ab.draw(2) }

        subject { drawn[:top] + drawn[:left] + drawn[:center] + drawn[:right] + drawn[:bottom] }

        it "returns a structure that we can build a graph from" do
          expect(subject).to eq("  |  \n  |  \n-- --\n  |  \n  |  \n")
        end
      end
      context "with a max of 3" do
        let(:drawn) { ab.draw(3) }

        subject { drawn[:top] + drawn[:left] + drawn[:center] + drawn[:right] + drawn[:bottom] }

        it "returns a structure that we can build a graph from" do
          expect(subject).to eq("   |   \n   |   \n   |   \n--- ---\n   |   \n   |   \n   |   \n")
        end
      end
    end

    context "quadrants" do
      let(:ab) { ComplexPlane.new }

      context "with one" do
        subject { ab.draw(1) }

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
        subject { ab.draw(2) }

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
        subject { ab.draw(3) }

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