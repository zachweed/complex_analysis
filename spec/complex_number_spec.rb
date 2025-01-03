require 'rspec'
require './complex_number.rb'
require 'pry'

RSpec.describe ComplexNumber do
  context "constructor" do
    it "initializes the real and imaginary parts" do
      cn = ComplexNumber.new(3, "3i")
      expect(cn.re).to eq(3)
      expect(cn.im).to eq("3")
    end
  end
  context "#find_iota" do
    context "with an exponent" do
      context "positive test case" do
        it "finds iota part" do
          cn = ComplexNumber.new(3, "i^5")
          expect(cn.i).to eq("i")
        end
      end
    end
    context "without an exponent" do
      context "positive test case" do
        it "finds iota part" do
          cn = ComplexNumber.new(3, "")
          expect(cn.i).to eq("")
        end
      end
    end
  end
  context "#find_base" do
    context "positive numbes" do
      it "find the base of a complex number before iota" do
        expect(ComplexNumber.new(3, "3i").send(:find_base, "3i")).to eq("3")
      end
    end
    context "negative numbers" do
      it "finds base of a complex number before iota" do
        expect(ComplexNumber.new(3, "-3i").send(:find_base, "-3i")).to eq("-3")
      end
    end
  end
end