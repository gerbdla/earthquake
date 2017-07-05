module V1
  class PalindromeController < ApplicationController

    def count
      count = 0
      Word.all.uniq.each do |word|
        if Palindrome.is_palindrome?(word.word)
          count += 1
        end
      end

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "word_count: #{count}"
        end
      end
    end
  end

end
