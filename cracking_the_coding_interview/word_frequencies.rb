#Design a method to find the frequency of occurances of any given word ina  book
# what if we were running this algorithm multiple times?
# Assuming book arrives at the function as one giant string. (if filename)


#First time, O(n) time, O(n) space. Subsequent calls are O(1) lookup

class WordFinders
  attr_reader :word_cache, :book
  def initialize(book)
    @word_cache = Hash.new
    @book = book
  end

  def word_freq seek_word
    punctuation =  %w(! . , "  ' ? -)
    seek_word = seek_word.downcase
    return @word_cache[seek_word] if !@word_cache[seek_word].nil?
    words = @book.split(' ')
    words.each do |word|
      word = word.downcase
      word = word.slice(0,-1) if punctuation.include?(word[-1])
      @word_cache[word] = 0 unless @word_cache[word]
      @word_cache[word] += 1
    end
    @word_cache[seek_word]
  end
end

a = WordFinders.new("The rain in Spain stays mainly on the plane. There is little one can do in the face of one's total obliteration. The quick brown fox jumped over the lazy dog")


# p a.word_freq "the"
# p a.word_freq "fox"
# p a.word_cache
