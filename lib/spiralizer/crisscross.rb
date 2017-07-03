class Spiralizer::Crisscross
  def self.crisscross(matrix:)
    Spiralizer.validate_input(matrix)
    matrix.map
          .with_index { |ary, ind| (ind % 2 == 0) ? ary : ary.reverse }
          .join(" ")
          .downcase
          .strip
  end
end
