class Spiralizer::Matrix
  def self.validate_range_and_dimenstions(range, dimensions)
    unless range.respond_to?(:to_a)
      fail Spiralizer::InvalidInput.new("valid range expected")
    end
    unless dimensions.respond_to?(:split) && dimensions =~ /\d+\s?x+\s?\d+/
      fail Spiralizer::InvalidInput.new("dimensions must be a string in '2x4' format")
    end
    unless range.count % 2 == 0
      puts("The last char will be excluded.")
    end
    rows, cols = dimensions.split("x").map(&:to_i)
    unless (range.count / rows) == cols || (range.count / cols) == rows
      fail Spiralizer::InvalidInput.new("cant build matrix with range/dimensions pair")
    end
  end

  def self.the_matrix(range:, dimensions:)
    validate_range_and_dimenstions(range, dimensions)
    count      = -1
    ary        = range.to_a
    rows, cols = dimensions.split("x").map(&:to_i)

    Array.new(cols) do
      Array.new(rows) do
        count += 1
        ary[count]
      end
    end
  end
end
