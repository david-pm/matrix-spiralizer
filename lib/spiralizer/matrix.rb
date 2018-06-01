class Spiralizer::Matrix
  attr_reader :range, :dimensions

  INVALID_PAIR       = 'can\'t build matrix with range/dimensions pair'.freeze
  INVALID_RANGE      = 'valid range expected'.freeze
  INVALID_DIMENSIONS = 'dimensions must be a string in \'2x4\' format'.freeze

  def self.the_matrix(range:, dimensions:)
    new(range, dimensions).build
  end

  def initialize(range, dimensions)
    @range = range
    @dimensions = dimensions
    validate_range_and_dimenstions
  end

  def validate_range_and_dimenstions
    fail Spiralizer::InvalidInput.new(INVALID_RANGE)      unless valid_range?
    fail Spiralizer::InvalidInput.new(INVALID_DIMENSIONS) unless valid_dimensions?
    fail Spiralizer::InvalidInput.new(INVALID_PAIR)       unless valid_pair?

    puts('WARNING: The last character will be excluded.') if range.count.odd?
  end

  def build
    range_enum = range.each
    Array.new(cols) { Array.new(rows) { range_enum.next } }
  end

  private

  def valid_range?
    range.respond_to?(:to_a)
  end

  def valid_dimensions?
    dimensions.respond_to?(:split) && dimensions =~ /\d+\s?x+\s?\d+/
  end

  def valid_pair?
    (range.count / rows) == cols || (range.count / cols) == rows
  end

  def split_dimensions
    @split_dimensions ||= dimensions.split('x').map(&:to_i)
  end

  def rows
    @rows ||= split_dimensions.first
  end

  def cols
    @cols ||= split_dimensions.last
  end
end
