require 'thor'
require 'spiralizer'
require 'spiralizer/matrices'

class Spiralizer::CLI < Thor
  attr_reader :action, :matrix

  desc "go", "starts a prompt that brings users to spiral heaven"
  def go
    clear_screen!
    say "What would you like to do? (choose a number)\n 1 - Build a matrix\n 2 - Generate a random matrix"
    @action = ask "> "
    delegate_build_action
  rescue Spiralizer::InvalidInput => e
    say "\nUh oh! #{e.message}"
  ensure
    quit_softly
  end

  no_commands do
    def delegate_build_action
      say "\n"
      case action
      when "1"
        range, dimensions = user_range_and_dimensions
        @matrix = Spiralizer::Matrix.the_matrix(range: range, dimensions: dimensions)
        last_steps
      when "2"
        range, dimensions = random_range_and_dimensions
        @matrix = Spiralizer::Matrix.the_matrix(range: range, dimensions: dimensions)
        last_steps
      else
        quit_softly
      end
    end

    def delegate_action
      say "\n"
      case action
      when "1"
        say Spiralizer::Spiralize.spiralize(matrix: matrix)
      when "2"
        say Spiralizer::Crisscross.crisscross(matrix: matrix)
      else
        quit_softly
      end
    end

    def user_range_and_dimensions
      range_response = ask("Please provide range. Acceptable format: (A-L) or (1-6)\n> ")
      values         = range_response.split("-")
      dimensions     = ask("Please provide dimensions. Acceptable format: (4x3) or (3x2)\n> ")
      return (values.first..values.last), dimensions
    end

    def random_range_and_dimensions
      say "\ngenerating..."
      sleep 1
      range_response, dimensions = Spiralizer::MATRICES[rand(6)]
      range = range_response.split("-")
      return (range.first..range.last), dimensions
    end

    def last_steps
      say "\nHere is your M A T R I X\n------------------------"
      matrix.each { |arr| say arr.join("\t") }
      say "\nWhat would you like to do with it? (choose a number)\n 1 - Spiralize it\n 2 - Crisscross it"
      @action = ask "> "
      delegate_action
    end

    def clear_screen!
      if Gem.win_platform?
        (system "cls")
      else
        (system "clear")
      end
    end

    def quit_softly
      say "\nexiting..."
      sleep 0.5
      exit!
    end
  end # no_command block
end
