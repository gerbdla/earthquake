class Anagram

  def sort_word(word)
    return [] unless word
    pivot = word[0]
    grouped = word.group_by { |e| e <=> pivot }
    sort_word(grouped[-1]) + grouped[0] + sort_word(grouped[1])
  end



end


a = Anagram.new
puts a.sort_word(["v","a"])