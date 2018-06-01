require 'spec_helper'

RSpec.describe Spiralizer::Spiralize do
  context 'character matrix' do
    let(:matrix) do
      [%w[A B C D], %w[E F G H], %w[I J K L], %w[M N O P], %w[Q R S T]]
    end

    let(:expected_result) { %Q{a b c d h l p t s r q m i e f g k o n j} }

    it 'returns a string in spiraling order' do
      expect(Spiralizer::Spiralize.new(matrix: matrix).perform).to eq expected_result
    end
  end

  context 'integer matrix' do
    let(:matrix) do
      [[1,2,3], [10, 11, 4], [9, 12, 5], [8, 7, 6]]
    end

    let(:expected_result) { %Q{1 2 3 4 5 6 7 8 9 10 11 12} }

    it 'handles numbers with multiple digits' do
      expect(Spiralizer::Spiralize.new(matrix: matrix).perform).to eq expected_result
    end
  end

  context 'invalid input' do
    let(:notamatrix) { [{a: 'b'}, 'bye'] }

    it 'only takes matrices' do
      expect{ Spiralizer::Spiralize.new(matrix: notamatrix) }
        .to raise_error Spiralizer::InvalidInput
    end
  end
end
