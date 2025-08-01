require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number itself for a single number" do
    expect(calculator.add("5")).to eq(5)
  end

  it "returns the sum of two numbers" do
    expect(calculator.add("1,2")).to eq(3)
  end

  it "returns the sum of multiple numbers" do
    expect(calculator.add("1,2,3")).to eq(6)
  end

  it "handles newlines as delimiters" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom single-character delimiters" do
    expect(calculator.add("//;\n1;2;3")).to eq(6)
  end

  it "raises exception for negative numbers" do
    expect {
      calculator.add("1,-3,3,-7")
    }.to raise_error("negatives not allowed: -3, -7")
  end

  it "ignores numbers greater than 1000" do
    expect(calculator.add("2,1001")).to eq(2)
  end
end
