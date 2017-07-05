module V1
  class AnagramController < ApplicationController

    def word
      compare_word = params[:word]
      words_array = []
      Word.all.uniq.each do |word|
        count = 0
        if Anagram.is_anagram?(compare_word, word)
          words_array << word
        end

      end

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "anagrams of the word #{compare_word}: #{words_array}"
        end
      end
    end

    def count
      Word.all.uniq.each do |word|
        compare_word = word
        count = 0
        Word.all.uniq.each do |word|
          if Anagram.is_anagram?(compare_word, word)
            count += 1
          end
        end
      end

      respond_to do |format|
        format.any(:words_json, :json) do
          render json: "word_count: #{word_count}"
        end
      end
    end
  end
end