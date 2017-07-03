require "spec_helper"

RSpec.describe Spiralizer do
  context "Spiralize" do
    it "returns a string in spiraling order" do
      matrix = [['A','B','C','D'], ['E','F','G','H'], ['I','J','K','L'], ['M','N','O','P'], ['Q','R','S','T']]
      expect(Spiralizer.spiralize(matrix: matrix)).to eq %Q{a b c d h l p t s r q m i e f g k o n j}
    end

    it "will handle numbers with multiple digits" do
      matrix = [[1,2,3], [10, 11, 4], [9, 12, 5], [8, 7, 6]]
      expect(Spiralizer.spiralize(matrix: matrix)).to eq %Q{1 2 3 4 5 6 7 8 9 10 11 12}
    end
  end

  it "has a version number" do
    expect(Spiralizer::VERSION).not_to be nil
  end

end
