=begin





PROBLEM:
input: 2 strings
1 string is original dna object
2nd string is comparison dna string
output:
integer which is hamming distance - different nucleotide between original and comparison

EXAMPLES:
GGACTGA
GGACTGA
0

ACT
GGA
3

GGACGGATTCTGACCTGGACTAATTTTGGGG
AGGACGGATTCTGACCTGGACTAATTTTGGGG
19

GGACG
GGTCG
1

ACCAGGG
ACTATGG
2

AAACTAGGGG
AGGCTAGCGGTAGGAC
3

GACTACGGACAGGGTAGGGAAT
GACATCGCACACC
5

AGACAACAGCCAGCCGCCGGATT
AGGCAA
1

AGACAACAGCCAGCCGCCGGATT
AGACATCTTTCAGCCGCCGGATTAGGCAA
4

AGACAACAGCCAGCCGCCGGATT
AGG
1

DATA STRUCTURE:
need to determine the shorter strand length and use that to iterate
loop through both strings and increment a hamming distance counter

ALGORITHM:
initialize
- original strand instance variable

hamming_distance (instance method)
- return 0 if either length is 0
- use a ternary to determine what the length of iteration should be based on shorter length
- initialize a counter at 0
- loop through the strings and increment the counter when character is different
- return the counter

=end

require 'pry'

class DNA
  def initialize(original)
    @original = original
  end

  def hamming_distance(other_seq)
    return 0 if @original.length == 0 || other_seq.length == 0
    length = @original.length <= other_seq.length ? @original.length : other_seq.length
    idx = 0
    hamming_dist_count = 0
    loop do
      hamming_dist_count += 1 if @original[idx] != other_seq[idx]
      idx += 1
      break if idx > length - 1
    end
    hamming_dist_count
  end
end