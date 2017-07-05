class Palindrome

  def self.is_palindrome?(word)
    if reverse(word) == word
      true
    else
      false
    end
  end

  private

  def self.reverse(word)
    arr_word = word.split("")
    reversed = []
    word.size.times {reversed << arr_word.pop}
    reversed
  end
end