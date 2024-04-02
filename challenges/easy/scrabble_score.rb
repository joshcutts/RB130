=begin

PROBLEM
input: string which is instance variable in
new Scrabble object

output: integer score when `score` instance method is invoked
on scrabble object


EXAMPLES:
non-alpha chars have 0 score

DATA STRUCTURE:
could use reduce potentially*
or loop through and add score
or get count of each letter then multiply out score

ALGORITHM
- have the letter correspond to value in hash
- iterate through each character and convert that char to score value,
increment the score
- return the score

=end

require 'pry'

class Scrabble
  attr_reader :word
  SCORE_CONVERT = {["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
                    ["D", "G"] => 2,
                    ["B", "C", "M", "P"] => 3,
                    ["F", "H", "V", "W", "Y"] => 4,
                    ["K"] => 5,
                    ["J", "X"] => 8,
                    ["Q", "Z"] => 10
                  }
  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?

    word.chars.inject(0) do |total_score, char|
      SCORE_CONVERT.each do |chars_array, val|
        total_score += val if chars_array.include?(char.upcase)
      end
      total_score
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end