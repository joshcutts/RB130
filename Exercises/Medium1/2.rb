Dir.chdir("/Users/joshuacutts/Documents/Documents-Joshua’s_MacBook_Pro/LaunchSchool/RB130/Exercises/Medium1")

# p txt.length
# p txt.count("") + 1
# p txt.join(" ").split(" ").length

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| puts "#{text.split("\n").count} lines"}
analyzer.process { |text| puts "#{text.split(' ').count} words"}


# class TextAnalyzer
#   def process
#     txt = yield
#     paragraphs = txt.count("") + 1
#     lines = txt.length
#     words = txt.join(" ").split(" ").length
#     puts "#{paragraphs} paragraphs"
#     puts "#{lines} lines"
#     puts "#{words} words"
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process {File.read('sample_text.txt').split(/\n/)}