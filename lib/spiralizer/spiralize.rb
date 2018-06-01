class Spiralizer::Spiralize
  def initialize(matrix:)
    Spiralizer.validate_input(matrix)
    @matrix  = matrix
    @result  = String.new
    @padding = String.new ' '
  end

  def perform
    until matrix.empty? do
      @result += @matrix.shift.join(padding).concat(padding)
      break if matrix.empty?
      @result += @matrix.map(&:pop).join(padding).concat(padding)
      @result += @matrix.pop.reverse.join(padding).concat(padding)
      @result += @matrix.map(&:shift).reverse.join(padding).concat(padding)
    end

    @result.downcase.strip
  end

  private

  attr_reader :padding, :result, :matrix
end
