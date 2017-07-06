class Palindrome

  def self.is_palindrome?(word)
    if reverse(word) == word
      true
    else
      false
    end
  end

  def self.count
    count = 0
    Word.all.uniq.each do |word|
      if Palindrome.is_palindrome?(word.word)
        count += 1
      end
    end
    count
  end

  private

  def self.reverse(word)
    arr_word = word.split("")
    reversed = []
    word.size.times {reversed << arr_word.pop}
    reversed.join("")
  end
end