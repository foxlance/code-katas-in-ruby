require "prime_factors.rb"

describe "Prime Factorials" do

  before { @factorial = PrimeFactorial.new }

  context "Produces a given number's factorial" do
    it "Prime factors of 1" do
      result = @factorial.generate 1
      expect(result).to eq []
    end

    it "Prime factors of 2" do
      expect(@factorial.generate(2)).to eq [2]
    end

    it "Prime factors of 3" do
      expect(@factorial.generate(3)).to eq [3]
    end

    it "Prime factors of 4" do
      expect(@factorial.generate(4)).to eq [2,2]
    end

    it "Prime factors of 5" do
      expect(@factorial.generate(5)).to eq [5]
    end

    it "Prime factors of 6" do
      expect(@factorial.generate(6)).to eq [2,3]
    end

    it "Prime factors of 8" do
      expect(@factorial.generate(8)).to eq [2, 2, 2]
    end

    it "Prime factors of 9" do
      expect(@factorial.generate(9)).to eq [3, 3]
    end

    it "Prime factors of 100" do
      expect(@factorial.generate(100)).to eq [2, 2, 5, 5]
    end
  end
end