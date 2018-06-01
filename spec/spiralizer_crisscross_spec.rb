require 'spec_helper'

RSpec.describe Spiralizer::Crisscross do
  context 'character matrix' do
    let(:matrix) { [%w[A B], %w[C D], %w[E F]] }
    let(:expected_result) { %Q{a b d c e f} }

    it 'returns a string in crisscross order' do
      expect(Spiralizer::Crisscross.crisscross(matrix: matrix)).to eq expected_result
    end
  end

  context 'integer matrix' do
    let(:matrix) do
      [[1,2,3], [101, 11, 4], [9, 12, 5], [8, 7, 6]]
    end

    let(:expected_result) { %Q{1 2 3 4 11 101 9 12 5 6 7 8} }

    it 'handles numbers with multiple digits' do
      expect(Spiralizer::Crisscross.crisscross(matrix: matrix)).to eq expected_result
    end
  end

  context 'invalid input' do
    let(:notamatrix) { [{a: 'b'}, 'bye'] }

    it 'only takes matrices' do
      expect{ Spiralizer::Crisscross.crisscross(matrix: notamatrix) }
        .to raise_error Spiralizer::InvalidInput
    end
  end
end

