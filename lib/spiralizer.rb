require "spiralizer/version"
require "pry"

module Spiralizer
  def self.spiralize(matrix:)
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
