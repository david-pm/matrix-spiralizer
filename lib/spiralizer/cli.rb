require 'thor'
require 'spiralizer'
require 'spiralizer/matrices'

class Spiralizer::CLI < Thor
  attr_reader :action, :matrix

  desc 'go', 'starts a prompt that brings users to spiral heaven'
  def go
    clear_screen!
    intro_prompt
    build_matrix
    output_matrix
    action_prompt
    delegate_action
  rescue Spiralizer::InvalidInput => e
    say "\nUh oh! #{e.message}"
  ensure
    quit_softly
  end

  no_commands do
    def intro_prompt
      say "What would you like to do? (choose a number)\n 1 - Build a matrix\n 2 - Generate a random matrix"
      @action = ask '> '
    end

    def action_prompt
      say "\nWhat would you like to do with it? (choose a number)\n 1 - Spiralize it\n 2 - Crisscross it"
      @action = ask '> '
    end

    def build_matrix
      say "\n"

      case action
      when '1' then range, dimensions = user_range_and_dimensions
      when '2' then range, dimensions = random_range_and_dimensions
      else quit_softly
      end

      @matrix = Spiralizer::Matrix.the_matrix(range: range, dimensions: dimensions)
    end

    def delegate_action
      say "\n"

      case action
      when '1' then say Spiralizer::Spiralize.new(matrix: matrix).perform
      when '2' then say Spiralizer::Crisscross.new(matrix: matrix).perform
      else quit_softly
      end
    end

    def user_range_and_dimensions
      range_response = ask("Please provide range. Acceptable format: (A-L) or (1-6)\n> ")
      values         = range_response.split('-')
      dimensions     = ask("Please provide dimensions. Acceptable format: (4x3) or (3x2)\n> ")
      return (values.first..values.last), dimensions
    end

    def random_range_and_dimensions
      say "\ngenerating..."
      pause_for_effect
      range_response, dimensions = Spiralizer::MATRICES[rand(6)]
      range = range_response.split('-')
      return (range.first..range.last), dimensions
    end

    def output_matrix
      say "\nHere is your M A T R I X\n------------------------"
      matrix.each { |inner| say inner.join("\t") }
    end

    def clear_screen!
      return system 'cls' if Gem.win_platform?
      system 'clear'
    end

    def pause_for_effect
      sleep 0.5
    end

    def quit_softly
      say "\nexiting..."
      pause_for_effect
      exit!
    end
  end
end
