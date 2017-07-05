class Anagram

  def self.sort_word(word)
    return [] unless word
    pivot = word[0]
    grouped = word.group_by { |e| e <=> pivot }
    sort_word(grouped[-1]) + grouped[0] + sort_word(grouped[1])
  end

  def self.is_anagram?(word1, word2)
    if sort_word(word1) == sort_word(word2)
      true
    else
      false
    end
  end
end

