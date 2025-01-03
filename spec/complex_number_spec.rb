require 'rspec'
require './complex_number.rb'

RSpec.describe ComplexNumber do
  let(:a){ "3 + 3i" }

  context "constructor" do
    it "initializes the real and imaginary parts" do
      cn = ComplexNumber.new(a)
      expect(cn.re).to eq("3")
      expect(cn.im).to eq("3")
    end
  end
  context "#complex_conjugate" do
    it "finds reflection" do
      cn = ComplexNumber.new(a)
      expect(cn.complex_conjugate.a).to eq("3 - 3i")
    end
  end
  context "#find_iota" do
    context "with an exponent" do
      context "positive test case" do
        context "i" do
          let(:a){ "3 + i^5" }
          it "finds iota part" do
            cn = ComplexNumber.new(a)
            expect(cn.i).to eq("i")
          end
        end
        context "-1" do
          let(:a){ "3 + i^6" }
          it "finds iota part" do
            cn = ComplexNumber.new(a)
            expect(cn.i).to eq("-1")
          end
        end
      end
    end
    context "without an exponent" do
      context "positive test case" do
        let(:a){ "3" }
        it "finds iota part" do
          cn = ComplexNumber.new(a)
          expect(cn.i).to eq("")
        end
      end
    end
  end
  context "#find_base" do
    context "positive numbes" do
      it "find the base of a complex number before iota" do
        expect(ComplexNumber.new(a).send(:find_base, "3i")).to eq("3")
      end
    end
    context "negative numbers" do
      it "finds base of a complex number before iota" do
        expect(ComplexNumber.new(a).send(:find_base, "-3i")).to eq("-3")
      end
    end
  end
end