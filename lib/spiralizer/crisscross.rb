class Spiralizer::Crisscross
  def initialize(matrix:)
    Spiralizer.validate_input(matrix)
    @matrix = matrix
  end

  def perform
    crisscross.join(' ').downcase.strip
  end

  private

  def crisscross
    @matrix.map.with_index do |inner, index|
      next inner if index.even?
      inner.reverse
    end
  end
end
