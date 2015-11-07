class WordSearch

  attr_reader :data

  def initialize(data)
    @dictionary = File.read("/usr/share/dict/words")
    @data = data
  end

  def search_dictionary(word_array)
    data.big_guy_counter += 1
    word_array = word_array.map do |word|
      if @dictionary.include?(word)
        "#{word} is a word!!!! vomit"
      else
        "#{word} is not a word."
      end
    end

    word_array.join("\n")

  end

end
