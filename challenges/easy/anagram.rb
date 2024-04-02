=begin

PROBLEM:
input: string & array of potential anagrams
string is instance varaible in Anagram object
output: array of actual anagrams (same letters)
case insensitive
don't reinclude argued string
final anagrams array should be sorted

EXAMPLES:


DATA STRUCTURE:


ALGORITHM:
`match` instance method
- create emtpy anagrams array
- iterate through each string in the array
  - split each string into array of characters (downcase)
  - check if sorted argued string is equal to sorted string
  - if they are equal add the string to the anagrams array
- return the sorted anagrams array

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    anagrams = []
    array.each do |w|
      original_chars = @word.chars.map(&:downcase).sort
      chars_array = w.chars.map(&:downcase).sort
      anagrams << w if original_chars == chars_array && @word.downcase != w.downcase
    end
    anagrams.sort
  end
end