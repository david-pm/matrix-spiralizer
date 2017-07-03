class Spiralizer::Spiralize
  # def self.validate_input(matrix)
  #   unless matrix.respond_to?(:first) && matrix.first.respond_to?(:join)
  #     fail Spiralizer::InvalidInput.new("spiralize only accepts a matrix")
  #   end
  # end

  def self.spiralize(matrix:)
    Spiralizer.validate_input(matrix)
    str = String.new

    until matrix.empty?
      str += matrix.shift.join(" ") + " "
      str += matrix.map(&:pop).join(" ") + " "           unless matrix.empty?
      str += matrix.pop.reverse.join(" ") + " "          unless matrix.empty?
      str += matrix.map(&:shift).reverse.join(" ") + " " unless matrix.empty?
    end

    # this works too...
    #
    # loop do
    #   begin
    #     str += matrix.shift.join(" ") + " "
    #     str += matrix.map(&:pop).join(" ") + " "
    #     str += matrix.pop.reverse.join(" ") + " "
    #     str += matrix.map(&:shift).reverse.join(" ") + " "
    #   rescue NoMethodError => e
    #     break if [:reverse, :map, :join].include?(e.name)
    #     fail e
    #   end
    # end

    str.downcase.strip
  end
end
