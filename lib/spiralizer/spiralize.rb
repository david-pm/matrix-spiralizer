class Spiralizer::Spiralize
  def self.spiralize(matrix:)
    Spiralizer.validate_input(matrix)
    str = String.new

    until matrix.empty?
      str += matrix.shift.join(" ") + " "
      str += matrix.map(&:pop).join(" ") + " "           unless matrix.empty?
      str += matrix.pop.reverse.join(" ") + " "          unless matrix.empty?
      str += matrix.map(&:shift).reverse.join(" ") + " " unless matrix.empty?
    end

    str.downcase.strip
  end
end
