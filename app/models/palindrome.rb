class Palindrome

  def reverse(word)
    arr_word = word.split("")
    reversed = []
    word.size.times { reversed << arr_word.pop }
    reversed
  end

  def is_palindrome(word)
    if reverse(word) == word
      true
    else
      false
    end
  end

end
