require "spec_helper"

RSpec.describe Spiralizer::Crisscross do
  it "returns a string in crisscross order" do
    matrix = [['A', 'B'], ['C', 'D'], ['E', 'F']]
    expect(Spiralizer::Crisscross.crisscross(matrix: matrix)).to eq %Q{a b d c e f}
  end
end

