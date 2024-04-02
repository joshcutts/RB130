=begin

PROBLEM:
return lyrics to beer song

input: 1 integer, 2 integers (range), no integers (entire song)
putput: appropriate number of lyrics

EXAMPLES:
99

3

2

1
0 should be "no"

0 appears to be special case
- No more bottles of beer
- Go to store and buy more

ALGORITHM:
3 class methods
- lyrics - no argument
- make empty string to append to  
- 99 to 0 range
  - text and interpolate the current num, then the num -1 
  - 
- verse - 1 argued integer
- verses - 2 argued integers

=end

class BeerSong
  def self.verse(n)
    ret_verse(n)
  end

  def self.verses(n1, n2)
    ret_verses = ""
    (n2..n1).reverse_each do |beer| 
      ret_verses << ret_verse(beer)
      ret_verses << "\n" unless beer == n2
    end
    ret_verses
  end

  def self.lyrics
    ret_lyrics = ""
    (0..99).reverse_each do |beer| 
      ret_lyrics << ret_verse(beer)
      ret_lyrics << "\n" unless beer == 0
    end
    ret_lyrics
  end

  class << self
    private
    def ret_verse(n)
      if n == 0
        verse = "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      elsif n == 1
        verse = "#{n} bottle of beer on the wall, #{n} bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      elsif n == 2
        verse = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
        "Take one down and pass it around, #{n-1} bottle of beer on the wall.\n"
      else
        verse = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
        "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
      end
      verse
    end
  end
end

puts BeerSong.verses(99, 98)