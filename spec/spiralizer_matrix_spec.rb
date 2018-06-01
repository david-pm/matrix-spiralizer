require 'spec_helper'

RSpec.describe Spiralizer::Matrix do
  context 'character matrix' do
    let(:matrix) do
      Spiralizer::Matrix.the_matrix(range: 'A'..'L', dimensions: '4x3')
    end

    let(:expected_matrix) do
      [%w[A B C D], %w[E F G H], %w[I J K L]]
    end

    it 'returns a matrix from a given range of letters' do
      expect(matrix).to eq expected_matrix
    end
  end

  context 'uneven range of numbers' do
    let(:matrix) do
      Spiralizer::Matrix.the_matrix(range: 1..7, dimensions: '3x2')
    end

    let(:expected_matrix) do
      [[1,2,3], [4,5,6]]
    end

    it 'returns a matrix from a given range of numbers, excluding last number' do
      expect(matrix).to eq expected_matrix
    end
  end

  context 'invalid input' do
    it 'raises when range not passed' do
      expect{ Spiralizer::Matrix.the_matrix(range: 'hi', dimensions: '3x2') }
        .to raise_error Spiralizer::InvalidInput, 'valid range expected'
    end

    it 'raises when mal-formatted dimensions are passed' do
      expect{ Spiralizer::Matrix.the_matrix(range: (1..4), dimensions: '3 2') }
        .to raise_error Spiralizer::InvalidInput, 'dimensions must be a string in \'2x4\' format'
    end

    it 'raises when matrix cannot be built with given input' do
      expect{ Spiralizer::Matrix.the_matrix(range: (1..4), dimensions: '3x2') }
        .to raise_error Spiralizer::InvalidInput, 'cant build matrix with range/dimensions pair'
    end
  end
end
