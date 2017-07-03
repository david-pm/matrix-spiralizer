require "spec_helper"

RSpec.describe Spiralizer::Matrix do
  it "returns a matrix from a given range of numbers or letters" do
    sample = [['A','B','C','D'], ['E','F','G','H'], ['I','J','K','L']]
    matrix = Spiralizer::Matrix.the_matrix(range: 'A'..'L', dimensions: "4x3")
    expect(matrix).to eq sample
  end

  it "uneven range excludes last character" do
    m = [[1,2,3], [4,5,6]]
    expect(Spiralizer::Matrix.the_matrix(range: 1..7, dimensions: "3x2")).to eq m
  end

  it "raises when range not passed" do
    expect{ Spiralizer::Matrix.the_matrix(range: "hi", dimensions: "3x2") }
      .to raise_error Spiralizer::InvalidInput,
                      "valid range expected"
  end

  it "raises when mal-formatted dimensions are passed" do
    expect{ Spiralizer::Matrix.the_matrix(range: (1..4), dimensions: "3 2") }
      .to raise_error Spiralizer::InvalidInput,
                      "dimensions must be a string in '2x4' format"
  end

  it "raises when matrix cannot be built with given input" do
    expect{ Spiralizer::Matrix.the_matrix(range: (1..4), dimensions: "3x2") }
      .to raise_error Spiralizer::InvalidInput,
                      "cant build matrix with range/dimensions pair"
  end
end
