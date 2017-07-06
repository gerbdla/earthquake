class Anagram

  def self.sort_word(word_arr)
    return [] unless word_arr
    pivot = word_arr[0]
    grouped = word_arr.group_by { |e| e <=> pivot }
    sort_word(grouped[-1]) + grouped[0] + sort_word(grouped[1])
  end

  def self.is_anagram?(word1, word2)
    if sort_word(word1) == sort_word(word2)
      true
    else
      false
    end
  end

  def self.count
    count = 0
    Word.all.uniq.each do |word|
      compare_word = word.word
      count = 0
      Word.all.uniq.each do |word|
        if Anagram.is_anagram?(compare_word.split(","), word.word.split(","))
          count += 1
        end
      end
    end
    count
  end

  def self.anagrams_of_word(compare_word)
    words_array = []

    Word.all.uniq.each do |word|
      count = 0
      if Anagram.is_anagram?(compare_word.split(","), word.word.split(","))
        words_array << word.word
      end
    end
    words_array
  end
end

