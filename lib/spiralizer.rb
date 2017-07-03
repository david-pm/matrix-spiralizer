require "spiralizer/version"
require "spiralizer/matrices"
require "spiralizer/matrix"
require "spiralizer/spiralize"
require "spiralizer/crisscross"

module Spiralizer
  class InvalidInput < StandardError; end

  def self.validate_input(matrix)
    unless matrix.respond_to?(:first) && matrix.first.respond_to?(:join)
      fail Spiralizer::InvalidInput.new("spiralize only accepts a matrix")
    end
  end
end
